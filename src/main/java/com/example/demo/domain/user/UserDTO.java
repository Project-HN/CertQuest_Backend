package com.example.demo.domain.user;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Builder;

import java.time.LocalDateTime;

@Entity
@Table(name = "USERS")
@NoArgsConstructor
@AllArgsConstructor
@Builder

@Data
public class UserDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "USER_ID")
    private Long userId;

    @Column(name = "EMAIL", unique = true, nullable = false)
    private String email;

    @Column(name = "NAME", nullable = false)
    private String name;

    @Column(name = "NICKNAME", unique = true, nullable = false)
    private String nickname;

    @Column(name = "PASSWORD", nullable = false)
    private String password;

    @Column(name = "SIGNUP_TYPE", nullable = false)
    private String signupType;

    @Column(name = "CREATED_AT")
    private LocalDateTime createdAt;
}