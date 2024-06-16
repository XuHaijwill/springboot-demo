package org.example.service;

import org.example.DemoSpringBootMyBatisPlusApplicationTests;
import org.example.entity.UserEntity;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import java.util.List;

public class UserServiceTest extends DemoSpringBootMyBatisPlusApplicationTests {

    @Autowired
    private IUserService userService;

    @Test
    void queryAll() {
        List<UserEntity> list = userService.queryAll();
        Assert.notEmpty(list);
    }
}