package com.odoo.skillswap.services;

import com.odoo.skillswap.configuration.customExceptions.UserRegistrationException;
import com.odoo.skillswap.dtos.UserDetailsDTO;
import com.odoo.skillswap.entities.SkillsTbl;
import com.odoo.skillswap.entities.UserDetailsTbl;
import com.odoo.skillswap.repos.UserDetailsRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.net.http.HttpRequest;
import java.time.LocalDateTime;
import java.util.stream.Collectors;

@Service
public class UserService {

    private final UserDetailsRepository userDetailsRepository;
    private final RestTemplate restTemplate;

    @Autowired
    public UserService(UserDetailsRepository userDetailsRepository, PasswordEncoder passwordEncoder, RestTemplate restTemplate) {
        this.userDetailsRepository = userDetailsRepository;
        this.restTemplate = restTemplate;
    }

    public UserDetailsDTO registerUser(UserDetailsDTO userDetailsDTO) {

        // Check if email already exists
        if (!userDetailsDTO.getEmail().isEmpty() && userDetailsRepository.existsByEmail(userDetailsDTO.getEmail())) {
            throw new UserRegistrationException("Email already exists");
        }

        // Encode password
        String encodedPassword = userDetailsDTO.getPassword();

        // Create and save user entity
        UserDetailsTbl userDetails = UserDetailsTbl.builder()
                .email(userDetailsDTO.getEmail())
                .name(userDetailsDTO.getName())
                .profilePictureUrl(userDetailsDTO.getProfilePictureUrl())
                .password(encodedPassword)
                .authProvider(UserDetailsTbl.AuthProvider.valueOf(userDetailsDTO.getAuthProvider().toUpperCase()))
                .creationTimestamp(LocalDateTime.now())
                .modificationTimestamp(LocalDateTime.now())
                .lastLoginTimestamp(LocalDateTime.now())
                .build();

        userDetailsRepository.save(userDetails);

        // Copy properties back to DTO
        BeanUtils.copyProperties(userDetails, userDetailsDTO);

        // Send welcome email
        /*if (userDetailsDTO.getEmail() != null && !userDetailsDTO.getEmail().isEmpty()) {
            EmailRequestDTO emailRequestDTO = new EmailRequestDTO();
            emailRequestDTO.setEmail(userDetailsDTO.getEmail());
            emailRequestDTO.setName(userDetails.getName());
            mailService.notifyUser(emailRequestDTO, EmailTemplate.welcome);
        }*/

        return userDetailsDTO;
    }

    public UserDetailsDTO mapToDTO(UserDetailsTbl user) {
        return UserDetailsDTO.builder()
                .uid(user.getUid())
                .email(user.getEmail())
                .name(user.getName())
                .profilePictureUrl(user.getProfilePictureUrl())
                .location(user.getLocation())
                .authProvider(user.getAuthProvider().name())
                .accountType(user.getAccountType().name())
                .availability(user.getAvailability().name())
                .skillsOffered(
                        user.getSkillsOffered().stream()
                                .collect(Collectors.toMap(SkillsTbl::getId, SkillsTbl::getName))
                )
                .skillsWanted(
                        user.getSkillsWanted().stream()
                                .collect(Collectors.toMap(SkillsTbl::getId, SkillsTbl::getName))
                )
                .build();
    }

}
