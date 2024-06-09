package org.example.service.impl;

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
    public Long selectById(String userNo) {

        return userMapper.selectById(1L);
    }
}
