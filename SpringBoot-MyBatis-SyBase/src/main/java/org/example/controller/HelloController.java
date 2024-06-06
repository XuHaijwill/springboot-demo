package org.example.controller;

import org.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @ClassName HelloController
 * @Description //TODO
 * @Author XuHaijwill
 * @Date 2024/6/6 19:21
 * @Version 1.0
 **/
@RestController
public class HelloController {

    @Autowired
    UserService userServiceImpl;

    @RequestMapping("hello")
    public String hello() {
        userServiceImpl.selectById("3333");
        return "Hello";
    }


}