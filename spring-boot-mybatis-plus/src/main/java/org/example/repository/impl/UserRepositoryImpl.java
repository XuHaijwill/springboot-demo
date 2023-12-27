package org.example.repository.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.example.dao.UserDao;
import org.example.entity.UserEntity;
import org.example.repository.MPUserRepository;
import org.springframework.stereotype.Service;

@Service
public class UserRepositoryImpl extends ServiceImpl<UserDao, UserEntity> implements MPUserRepository {
}
