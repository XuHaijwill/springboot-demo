package org.example.repository;

import com.baomidou.mybatisplus.extension.service.IService;
import org.example.entity.UserEntity;
import org.springframework.stereotype.Service;

@Service
public interface MPUserRepository extends IService<UserEntity> {
}
