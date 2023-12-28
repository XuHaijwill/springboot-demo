package org.example.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.example.entity.LogEntity;

import java.util.List;

public interface LogService {
    void add();
    List<LogEntity> search();

}
