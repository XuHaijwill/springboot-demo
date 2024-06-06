package org.example.mapper;

import org.example.model.Goods;

public interface GoodsMapper {
    int insert(Goods record);

    int insertSelective(Goods record);
}