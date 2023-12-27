package org.example.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.example.entity.UserEntity;

import java.util.Arrays;

public class UserService {

    public void orderBy1() {
        LambdaQueryWrapper<UserEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.orderByDesc(UserEntity::getId);
    }

    public void orderBy2() {
        LambdaQueryWrapper<UserEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.orderByDesc(Arrays.asList(UserEntity::getUsername, UserEntity::getPassword));
    }

    public void orderBy3() {
        QueryWrapper<UserEntity> qw = new QueryWrapper<>();
        qw.orderByDesc(Arrays.asList("username", "password"));
    }

}
