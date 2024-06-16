package org.example.service;

import org.example.entity.UserEntity;

import java.util.List;

public interface IUserService {

    boolean insertOrUpdate(UserEntity userEntity);

    List<UserEntity> queryAll();

}
