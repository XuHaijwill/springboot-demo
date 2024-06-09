package org.example.mapper;

import java.math.BigDecimal;
import org.example.model.Test;

public interface TestMapper {
    int deleteByPrimaryKey(BigDecimal tId);

    int insert(Test record);

    int insertSelective(Test record);

    Test selectByPrimaryKey(BigDecimal tId);

    int updateByPrimaryKeySelective(Test record);

    int updateByPrimaryKeyWithBLOBs(Test record);

    int updateByPrimaryKey(Test record);
}