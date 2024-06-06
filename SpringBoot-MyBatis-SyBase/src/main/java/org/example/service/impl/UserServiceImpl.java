package org.example.service.impl;

import org.example.mapper.UserMapper;
import org.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName UserServiceImpl
 * @Description //TODO
 * @Author XuHaijwill
 * @Date 2024/6/6 19:22
 * @Version 1.0
 **/
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public String getUserNo(String userNo) {

        return userMapper.getUserNo("0101110000057398");
    }
}
