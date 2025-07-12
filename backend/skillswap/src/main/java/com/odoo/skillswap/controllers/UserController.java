package com.odoo.skillswap.controllers;

import com.odoo.skillswap.configuration.customExceptions.UserRegistrationException;
import com.odoo.skillswap.dtos.UserDetailsDTO;
import com.odoo.skillswap.services.UserService;
import jakarta.validation.constraints.Size;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping
    public String getMe() {
        return "Welcome to Skill Swap";
    }

    @PostMapping("/register")
    public ResponseEntity<UserDetailsDTO> registerUser(
            @RequestHeader(value = HttpHeaders.AUTHORIZATION, required = false) String token,
            @RequestBody UserDetailsDTO userDetailsDTO) {

        try {
            UserDetailsDTO savedUser = userService.registerUser(userDetailsDTO);
            return ResponseEntity.status(HttpStatus.CREATED).body(savedUser);
        } catch (UserRegistrationException ex) {
            // Let GlobalExceptionHandler handle this
            throw ex;
        } catch (Exception ex) {
            // For unexpected errors
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/public")
    public ResponseEntity<?> getAllPublicUsers(
            @RequestParam(value = "skill", required = false)
            @Size(max = 50, message = "Skill name must not exceed 50 characters") String skillName) {

        List<UserDetailsDTO> users = userService.getAllPublicUsers(skillName);

        if (users.isEmpty()) {
            return ResponseEntity.noContent().build(); // 204 No Content
        }

        return ResponseEntity.ok(users);
    }
}
