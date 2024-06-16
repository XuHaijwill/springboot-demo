package org.example.controller;

import lombok.AllArgsConstructor;
import org.example.service.IUserService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
public class UserController {

    private IUserService userService;

    @RequestMapping("hello")
    public String hello(){
        return "Hello Word!";
    }

}
