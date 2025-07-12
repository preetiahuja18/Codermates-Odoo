package com.odoo.skillswap.utils;


import java.util.regex.Pattern;

public class ValidationUtil implements Utility{

    private static final Pattern EMAIL_PATTERN = Pattern.compile(
            "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$");

    // Regex for strong password
    private static final String PASSWORD_PATTERN =
            "^(?=.*[0-9])" +           // At least 1 digit
                    "(?=.*[a-z])" +            // At least 1 lowercase letter
                    "(?=.*[A-Z])" +            // At least 1 uppercase letter
                    "(?=.*[@#$%^&+=!])" +      // At least 1 special character
                    "(?=\\S+$)" +              // No whitespace
                    ".{8,}$";                  // At least 8 characters

    private static final Pattern PASS_PATTERN = Pattern.compile(PASSWORD_PATTERN);

    /**
     * Checks if the password is strong.
     *
     * @param password Password to check
     * @return true if strong, false otherwise
     */
    public static boolean isStrongPassword(String password) {
        if (password == null) {
            return false;
        }
        return PASS_PATTERN.matcher(password).matches();
    }

    public static boolean isValidEmail(String email) {
        return EMAIL_PATTERN.matcher(email).matches();
    }

}

