package com.odoo.skillswap.dtos;

import jakarta.validation.constraints.NotBlank;
import lombok.*;

import java.time.LocalDateTime;
import java.util.Map;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserDetailsDTO {

    private Long uid;

    @NonNull
    @NotBlank
    private String email;

    private String name;

    private String profilePictureUrl;

    private String location;



    private String password;

    private String authProvider;  // EMAIL / MOBILE / GOOGLE

    private String accountType;   // PUBLIC / PRIVATE

    private String availability;  // DAILY / WEEKDAYS / WEEKENDS

    private Map<Long, String> skillsOffered;

    private Map<Long, String> skillsWanted;

}
