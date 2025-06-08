package com.example.demo.service.user;

import com.example.demo.domain.user.UserDTO;

import java.util.ArrayList;


public interface UserService {
    ArrayList<UserDTO> getUserInfo();
}