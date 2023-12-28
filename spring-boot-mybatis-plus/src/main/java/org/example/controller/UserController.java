package org.example.controller;

import org.example.service.UserService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {

    private UserService userService;

    @RequestMapping("hello")
    public String hello(){
        return "Hello Word!";
    }

}
