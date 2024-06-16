package org.example.service.impl;

import lombok.AllArgsConstructor;
import org.example.entity.UserEntity;
import org.example.mapper.UserMapper;
import org.example.service.IUserService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 增加 AllArgsConstructor 则不需要添加automation注解
 */
@Service
@AllArgsConstructor
public class UserServiceImpl implements IUserService {

    private UserMapper userMapper;

    @Override
    public List<UserEntity> queryAll() {
        return userMapper.selectList(null);
    }
}
