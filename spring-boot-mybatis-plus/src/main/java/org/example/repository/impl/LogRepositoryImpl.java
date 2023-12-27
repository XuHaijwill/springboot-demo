package org.example.repository.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.example.dao.ILogDao;
import org.example.entity.LogEntity;
import org.example.repository.MPLogRepository;
import org.springframework.stereotype.Service;

@Service
public class LogRepositoryImpl extends ServiceImpl<ILogDao, LogEntity> implements MPLogRepository {
}

