package com.example.demo.mapper.user;

import com.example.demo.domain.user.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface UserMapper{
    ArrayList<UserDTO> getUserInfo();
}