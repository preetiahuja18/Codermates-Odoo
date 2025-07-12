package com.odoo.skillswap.controllers;

import com.odoo.skillswap.configuration.JwtService;
import com.odoo.skillswap.dtos.LoginRequest;
import com.odoo.skillswap.dtos.UserDetailsDTO;
import com.odoo.skillswap.services.AuthService;
import com.odoo.skillswap.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/v1/auth")
public class AuthController {

    private final AuthService authService;


    @Autowired
    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @PostMapping("/")
    public ResponseEntity<?> authMe(@RequestBody LoginRequest loginRequest) {
        return authService.authMe(loginRequest);
    }
    @PostMapping("/refresh-token")
    public ResponseEntity<Map<String, String>> refreshToken(@RequestBody Map<String, String> request) {
        return authService.refreshToken(request);
    }
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest loginRequest) {
        return authService.loginUser(loginRequest);
    }

    @PostMapping("/register")
    public ResponseEntity<UserDetailsDTO> registerUser(
            @RequestHeader(value = HttpHeaders.AUTHORIZATION, required = false) String token,
            @RequestBody UserDetailsDTO userDetailsDTO) {

        return authService.registerUser(token, userDetailsDTO);
    }


}
