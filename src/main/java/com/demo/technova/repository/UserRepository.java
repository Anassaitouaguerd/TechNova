package com.demo.technova.repository;

import com.demo.technova.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByIdentificationNumber(String identificationNumber);
    List<User> findByNationality(String nationality);
    List<User> findByExpirationDateBefore(LocalDate date);
    List<User> findByActive(boolean active);
}