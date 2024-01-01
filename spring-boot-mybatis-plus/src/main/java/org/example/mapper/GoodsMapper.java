package org.example.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.example.entity.GoodsEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsMapper extends BaseMapper<GoodsEntity> {

    /**
     * 根据商品名称查询
     */
    List<GoodsEntity> queryByName(@Param("name") String name);

}

