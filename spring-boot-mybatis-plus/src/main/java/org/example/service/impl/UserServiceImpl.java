package org.example.service.impl;

import lombok.AllArgsConstructor;
import org.example.entity.UserEntity;
import org.example.mapper.UserMapper;
import org.example.service.UserService;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    private UserMapper userMapper;

    @Override
    public List<UserEntity> queryAll() {
        return userMapper.selectList(null);
    }
}
