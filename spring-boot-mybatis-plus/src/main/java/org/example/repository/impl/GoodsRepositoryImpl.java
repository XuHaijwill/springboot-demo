package org.example.repository.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.example.dao.IGoodsDao;
import org.example.entity.GoodsEntity;
import org.example.repository.MPGoodsRepository;
import org.springframework.stereotype.Service;

@Service
public class GoodsRepositoryImpl extends ServiceImpl<IGoodsDao, GoodsEntity> implements MPGoodsRepository {
}
