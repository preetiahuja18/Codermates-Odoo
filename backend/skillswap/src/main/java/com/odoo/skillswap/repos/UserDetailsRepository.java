package com.odoo.skillswap.repos;

import com.odoo.skillswap.entities.UserDetailsTbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserDetailsRepository extends JpaRepository<UserDetailsTbl, Long> {

    //Check email exist or not
    Boolean existsByEmail(String email);
    Optional<UserDetailsTbl >findByEmail(String email);

    // Spring Data magic: fetch users by skill name
    List<UserDetailsTbl> findBySkillsOffered_Name(String skillName);

    //  Fetch users by partial skill name (e.g., "Photo" matches "Photoshop")
    @Query("SELECT u FROM UserDetailsTbl u JOIN u.skillsOffered s WHERE LOWER(s.name) LIKE LOWER(CONCAT('%', :skillName, '%'))")
    List<UserDetailsTbl> searchUsersBySkillName(String skillName);
    // Fetch all users with PUBLIC account
    List<UserDetailsTbl> findByAccountType(UserDetailsTbl.AccountType accountType);


}
