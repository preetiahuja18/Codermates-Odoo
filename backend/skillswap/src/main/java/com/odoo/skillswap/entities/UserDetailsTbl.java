package com.odoo.skillswap.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "user_details",schema = "auth")
public class UserDetailsTbl {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long uid;

    @Email
    @Column(nullable = false, unique = true, length = 100)
    private String email;

    @Column(length = 100)
    private String name;

    @Column(length = 255)
    private String profilePictureUrl;

    @Column(nullable = false, length = 255)
    private String password;

    @Column(nullable = false, length = 255)
    private String location;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private AuthProvider authProvider;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private AccountType accountType;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Availability availability;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<SkillsTbl> skillsOffered = new ArrayList<>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<SkillsTbl> skillsWanted = new ArrayList<>();

    @Column(nullable = false, updatable = false)
    private LocalDateTime creationTimestamp;

    @Column(nullable = false)
    private LocalDateTime modificationTimestamp;

    private LocalDateTime lastLoginTimestamp;

    public enum AuthProvider {
        EMAIL,
        MOBILE,
        GOOGLE
    }
    public enum AccountType {
        PRIVATE,
        PUBLIC
    }
public enum Availability {
        DAILY,
        WEEKDAYS,
    WEEKENDS
    }

    @PrePersist
    protected void onCreate() {
        this.creationTimestamp = LocalDateTime.now();
        this.modificationTimestamp = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        this.modificationTimestamp = LocalDateTime.now();
    }
}
