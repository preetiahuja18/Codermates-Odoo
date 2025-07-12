package com.odoo.skillswap.controllers;

import com.odoo.skillswap.configuration.customExceptions.UserRegistrationException;
import com.odoo.skillswap.dtos.UserDetailsDTO;
import com.odoo.skillswap.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
}
