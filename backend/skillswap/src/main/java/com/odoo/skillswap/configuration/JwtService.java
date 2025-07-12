package com.odoo.skillswap.configuration;

import com.odoo.skillswap.constants.Constants;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Component
public class JwtService {

    @Value("${jwt.secret:}")
    private String SECRET_KEY; // Use env variable in production

    @Value("${jwt.access-token.expiration:}")
    private Duration accessTokenExpiration;

    @Value("${jwt.refresh-token.expiration:}")
    private Duration refreshTokenExpiration;

    public long getAccessTokenExpirationMillis() {
        return accessTokenExpiration.toMillis();  // Converts to milliseconds
    }

    public long getRefreshTokenExpirationMillis() {
        return refreshTokenExpiration.toMillis();  // Converts to milliseconds
    }

    public String generateToken(String email, Map<String, Object> sessionData) {
        Date now = new Date();
        Date expiryDate = new Date(now.getTime() + getAccessTokenExpirationMillis());

        return Jwts.builder()
                .setSubject(email)
                .claim(Constants.SessionData.SESSION_DATA, sessionData)
                .setIssuedAt(now)
                .setExpiration(expiryDate)
                .signWith(SignatureAlgorithm.HS256, SECRET_KEY.getBytes(StandardCharsets.UTF_8))
                .compact();
    }

    public String generateRefreshToken(String email) {
        Date now = new Date();
        Date expiryDate = new Date(now.getTime() + getRefreshTokenExpirationMillis());

        return Jwts.builder()
                .setSubject(email)
                .setIssuedAt(now)
                .setExpiration(expiryDate)
                .signWith(SignatureAlgorithm.HS256, SECRET_KEY.getBytes(StandardCharsets.UTF_8))
                .compact();
    }

    public boolean validateRefreshToken(String token) {
        try {
            Jwts.parser()
                    .setSigningKey(SECRET_KEY.getBytes(StandardCharsets.UTF_8))
                    .parseClaimsJws(token);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean validateToken(String token) {
        try {
            extractClaims(token);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public String extractEmail(String token) {
        return extractClaims(token).getSubject();
    }

    public Map<String, Object> extractSessionData(String token) {
        return extractClaims(token).get(Constants.SessionData.SESSION_DATA, HashMap.class);
    }

    public Object extractRequestId(String token) {
        Map<String, Object> sessionData = extractSessionData(token);
        if (sessionData != null && sessionData.containsKey(Constants.SessionData.REQUEST_ID)) {
            return sessionData.get(Constants.SessionData.REQUEST_ID);
        }
        return null;
    }

    private Claims extractClaims(String token) {
        return Jwts.parser()
                .setSigningKey(SECRET_KEY.getBytes(StandardCharsets.UTF_8))
                .parseClaimsJws(token)
                .getBody();
    }
}
