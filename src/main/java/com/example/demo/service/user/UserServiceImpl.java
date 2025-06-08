package com.example.demo.service.user;

import com.example.demo.domain.user.UserDTO;
import com.example.demo.mapper.user.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper usermapper;

    @Override
    public ArrayList<UserDTO>  getUserInfo(){
        return usermapper.getUserInfo();
    }

}
