package org.example.service;

import org.example.entity.LogEntity;

import java.util.List;

public interface ILogService {
    void add();
    List<LogEntity> search();

}
