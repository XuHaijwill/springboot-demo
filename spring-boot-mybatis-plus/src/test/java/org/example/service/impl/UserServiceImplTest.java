package org.example.service.impl;

import org.example.DemoSpringBootMyBatisPlusApplicationTests;
import org.example.entity.UserEntity;
import org.example.service.IUserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import java.util.List;

class UserServiceImplTest extends DemoSpringBootMyBatisPlusApplicationTests {

    @Autowired
    private IUserService userService;

    @Test
    void addUser(){
        UserEntity userEntity = new UserEntity();
        userEntity.setId(1L);
        userEntity.setNickname("hello");
        userService.insertOrUpdate(userEntity);
    }
    
    @Test
    void queryAll() {
        List<UserEntity> list = userService.queryAll();
        Assert.notEmpty(list);
    }
}