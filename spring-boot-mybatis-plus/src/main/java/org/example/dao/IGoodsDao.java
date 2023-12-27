package org.example.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.example.entity.GoodsEntity;

import java.util.List;

@Mapper
public interface IGoodsDao extends BaseMapper<GoodsEntity> {

    /**
     * 根据商品名称查询
     */
    List<GoodsEntity> queryByName(@Param("name") String name);

}

