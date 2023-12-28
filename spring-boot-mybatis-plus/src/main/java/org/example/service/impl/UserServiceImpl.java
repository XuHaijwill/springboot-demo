package org.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.example.entity.UserEntity;
import org.example.service.UserService;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Override
    public List<UserEntity> orderBy1() {
        LambdaQueryWrapper<UserEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.orderByDesc(UserEntity::getId);
        return null;
    }

    @Override
    public List<UserEntity> orderBy2() {
        LambdaQueryWrapper<UserEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.orderByDesc(Arrays.asList(UserEntity::getUsername, UserEntity::getPassword));
        return null;
    }

    @Override
    public List<UserEntity> orderBy3() {
        QueryWrapper<UserEntity> qw = new QueryWrapper<>();
        qw.orderByDesc(Arrays.asList("username", "password"));
        return null;
    }
}
