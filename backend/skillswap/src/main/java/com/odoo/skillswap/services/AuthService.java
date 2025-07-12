package com.odoo.skillswap.services;

import com.odoo.skillswap.configuration.JwtService;
import com.odoo.skillswap.configuration.customExceptions.UserRegistrationException;
import com.odoo.skillswap.constants.Constants;
import com.odoo.skillswap.dtos.LoginRequest;
import com.odoo.skillswap.dtos.UserDetailsDTO;
import com.odoo.skillswap.repos.UserDetailsRepository;
import com.odoo.skillswap.utils.ValidationUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class AuthService {

    private final JwtService jwtService;
    private final UserDetailsRepository  userDetailsRepository;
    private final AuthenticationManager authenticationManager;
    private final PasswordEncoder passwordEncoder;
    private final UserService userService;

    @Autowired
    public AuthService(JwtService jwtService, UserDetailsRepository userDetailsRepository, AuthenticationManager authenticationManager, PasswordEncoder passwordEncoder, UserService userService) {
        this.jwtService = jwtService;
        this.userDetailsRepository = userDetailsRepository;
        this.authenticationManager = authenticationManager;
        this.passwordEncoder = passwordEncoder;
        this.userService = userService;
    }

    public ResponseEntity<?> authMe(LoginRequest loginRequest) {
        if (loginRequest.getEmail().isEmpty()) {
            return ResponseEntity.badRequest().body("Please Provide Email");
        } else if (!ValidationUtil.isValidEmail(loginRequest.getEmail())) {
            return ResponseEntity.badRequest().body("Email is not Valid");
        } else if ((loginRequest.getPassword()==null || loginRequest.getPassword().isEmpty())) {
            return ResponseEntity.badRequest().body("Please Provide Password");
        } else if (!ValidationUtil.isStrongPassword(loginRequest.getPassword())) {
            return ResponseEntity.badRequest().body("Provide a Strong Password  ");
        }else {

            // Create JWT tokens
            Map<String, Object> sessionData = new HashMap<>();
            sessionData.put(Constants.SessionData.REQUEST_ID, passwordEncoder.encode(loginRequest.getPassword()));

            String accessToken = jwtService.generateToken(loginRequest.getEmail(), sessionData);
            String refreshToken = jwtService.generateRefreshToken(loginRequest.getEmail());

            // Prepare response
            Map<String, Object> response = new HashMap<>();
            response.put("accessToken", accessToken);
            response.put("refreshToken", refreshToken);
            response.put("email", loginRequest.getEmail());
            if(userDetailsRepository.existsByEmail(loginRequest.getEmail())) {
                response.put("flag",(short)1);
                response.put("msg", "Email Exists");
            }
            else {
                response.put("flag",(short)2);
                response.put("msg", "Email Doesn't Exist");
            }
            return ResponseEntity.ok(response);
        }
    }
    public ResponseEntity<?> loginUser(LoginRequest loginRequest) {
        try {
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(
                            loginRequest.getEmail(),
                            loginRequest.getPassword()
                    )
            );
            SecurityContextHolder.getContext().setAuthentication(authentication);

            String jwtToken = jwtService.generateToken(loginRequest.getEmail(), new HashMap<>());
            return ResponseEntity.ok(Map.of("accessToken", jwtToken));
        } catch (BadCredentialsException ex) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid credentials");
        }
    }


    public ResponseEntity<UserDetailsDTO> registerUser(String token, UserDetailsDTO userDetailsDTO) {
        try {
            String pw= (String) jwtService.extractRequestId(token);
            if(pw==null || pw.isEmpty() || pw.equalsIgnoreCase("null")){
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
            }
            userDetailsDTO.setPassword(pw);
            UserDetailsDTO savedUser = userService.registerUser(userDetailsDTO);
            savedUser.setPassword(null);
            String jwtToken = jwtService.generateToken(userDetailsDTO.getEmail(), new HashMap<>());
            return ResponseEntity.status(HttpStatus.CREATED).header(HttpHeaders.AUTHORIZATION,jwtToken).body(savedUser);
        } catch (UserRegistrationException ex) {
            // Let GlobalExceptionHandler handle this
            throw ex;
        } catch (Exception ex) {
            // For unexpected errors
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
    public ResponseEntity<Map<String, String>> refreshToken(Map<String, String> request) {
        String refreshToken = request.get("refreshToken");

        if (refreshToken == null || refreshToken.isEmpty()) {
            return ResponseEntity.badRequest().build();
        }

        boolean isValid = jwtService.validateRefreshToken(refreshToken);
        if (!isValid) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }

        String email = jwtService.extractEmail(refreshToken);

        String newAccessToken = jwtService.generateToken(email, new HashMap<>());
        String newRefreshToken = jwtService.generateRefreshToken(email);

        Map<String, String> response = new HashMap<>();
        response.put("accessToken", newAccessToken);
        response.put("refreshToken", newRefreshToken);

        return ResponseEntity.ok(response);
    }
}
