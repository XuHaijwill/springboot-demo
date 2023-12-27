package org.example.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.example.entity.LogEntity;

@Mapper
public interface ILogDao extends BaseMapper<LogEntity> {
}
