package org.example.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.example.DemoSpringBootMyBatisPlusApplicationTests;

import org.example.domain.entity.SysUser;
import org.example.service.ISysUserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import java.util.List;

class UserServiceImplTest extends DemoSpringBootMyBatisPlusApplicationTests {

    @Autowired
    private ISysUserService userService;

    
    @Test
    void selectPageVo() {
        SysUser sysUser = new SysUser();
        IPage page = userService.selectPageVo(sysUser, new Page<>(1, 3));
        Assert.notNull(page);
    }
}