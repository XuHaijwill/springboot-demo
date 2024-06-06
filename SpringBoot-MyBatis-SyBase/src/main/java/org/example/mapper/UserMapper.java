package org.example.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * @ClassName UserMapper
 * @Description //TODO
 * @Author XuHaijwill
 * @Date 2024/6/6 19:23
 * @Version 1.0
 **/
@Repository
public interface UserMapper {

    String getUserNo(@Param("cardNo") String cardNo);
}

