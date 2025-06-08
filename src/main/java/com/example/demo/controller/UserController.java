package com.example.demo.controller;

import com.example.demo.domain.user.UserDTO;
import com.example.demo.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/api/users")
public class UserController {
    @Autowired
    private UserService userservice;

    @GetMapping("/info")
    public ArrayList<UserDTO> getUserInfo(){
        ArrayList<UserDTO> userList = userservice.getUserInfo();

        if (userList != null && !userList.isEmpty()) {
            System.out.println("콘솔 출력: 사용자 데이터가 존재합니다. 총 " + userList.size() + "개.");
            for (UserDTO user : userList) {
                System.out.println("--------------------");
                System.out.println("User ID: " + user.getUserId());
                System.out.println("Email: " + user.getEmail());
                System.out.println("Name: " + user.getName());
                System.out.println("Nickname: " + user.getNickname());
                System.out.println("Password: " + user.getPassword());
                System.out.println("Signup Type: " + user.getSignupType());
                System.out.println("Created At: " + user.getCreatedAt());
            }
        } else {
            System.out.println("콘솔 출력: 사용자 데이터가 존재하지 않습니다.");
        }

        return userList;
    }
}