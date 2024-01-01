package org.example.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.example.entity.UserEntity;

import java.util.Arrays;
import java.util.List;

public interface UserService {

    List<UserEntity> queryAll();

}
