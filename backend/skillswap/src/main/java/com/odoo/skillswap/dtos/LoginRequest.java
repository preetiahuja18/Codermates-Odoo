package com.odoo.skillswap.dtos;

import lombok.Data;

@Data
public class LoginRequest {
    private String email;
    private String password;
}
