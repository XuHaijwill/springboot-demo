package org.example.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.example.model.User;

@Mapper
public interface UserMapper {
    int insert(User record);

    int insertSelective(User record);

    Long selectById(Long id);
}