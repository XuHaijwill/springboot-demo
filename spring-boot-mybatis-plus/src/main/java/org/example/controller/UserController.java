package org.example.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.domain.entity.SysUser;
import org.example.service.ISysUserService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@AllArgsConstructor
public class UserController {

    private ISysUserService userService;


    @RequestMapping(value = "/selectPage",method = RequestMethod.GET)
    public IPage<SysUser> selectPage(SysUser sysUser){
        log.info("selectPage start");
        IPage page = userService.selectPageVo(sysUser, new Page<>(1, 10));
        log.info("selectPage end");
        return page;
    }

    @RequestMapping("hello")
    public String hello(){
        return "Hello Word!";
    }

}
