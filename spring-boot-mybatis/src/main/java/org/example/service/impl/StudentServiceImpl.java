package org.example.service.impl;

import lombok.AllArgsConstructor;
import org.example.domain.entity.Student;
import org.example.mapper.StudentMapper;
import org.example.service.StudentService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName StudentServiceImpl
 * @Description //TODO
 * @Author XuHaijwill
 * @Date 2024/1/1 9:23
 * @Version 1.0
 **/
@Service
@AllArgsConstructor
public class StudentServiceImpl implements StudentService {

    private StudentMapper studentMapper;

    @Override
    public List<Student> selectAll() {
        return studentMapper.selectAll();
    }
}
