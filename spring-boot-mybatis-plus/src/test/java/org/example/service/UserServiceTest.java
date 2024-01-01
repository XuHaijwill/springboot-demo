package org.example.service;

import org.example.DemoSpringBootMyBatisPlusApplicationTests;
import org.example.entity.UserEntity;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class UserServiceTest extends DemoSpringBootMyBatisPlusApplicationTests {

    @Autowired
    private UserService userService;

    @Test
    void queryAll() {
        List<UserEntity> list = userService.queryAll();
        Assert.notEmpty(list);
    }
}