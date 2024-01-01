package org.example.service;

import org.example.domain.entity.Student;

import java.util.List;

/**
 * @ClassName StudentService
 * @Description //TODO
 * @Author XuHaijwill
 * @Date 2024/1/1 9:22
 * @Version 1.0
 **/
public interface StudentService {

    List<Student> selectAll();
}
