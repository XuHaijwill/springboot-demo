package org.example.service;

import org.example.domain.entity.Student;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.core.IsInstanceOf.instanceOf;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
public class StudentServiceTest {

    @Autowired
    private StudentService studentService;

    @Test
    void selectAll() {
        studentService.selectAll();
    }

    @Test
    void selectAnnotationAll() {
        studentService.selectAnnotationAll();
    }

    @Test
    void insertStudent() {
        Student student = Student.builder().name("mybatisDemo").age(25).classname("Chinese").build();
        int result = studentService.insertStudent(student);
        assertEquals(1, result);
    }
}