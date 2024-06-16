package org.example.mapper;

import org.example.domain.entity.User2;

public interface User2Mapper {
    int deleteByPrimaryKey(Long id);

    int insert(User2 record);

    int insertSelective(User2 record);

    User2 selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(User2 record);

    int updateByPrimaryKey(User2 record);
}