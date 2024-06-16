package org.example.service;

import org.example.entity.UserEntity;

import java.util.List;

public interface IUserService {

    List<UserEntity> queryAll();

}
