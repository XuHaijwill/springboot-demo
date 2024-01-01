package org.example.controller;

import lombok.AllArgsConstructor;
import org.example.domain.entity.Student;
import org.example.service.StudentService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @ClassName StudentController
 * @Description //TODO
 * @Author XuHaijwill
 * @Date 2024/1/1 10:09
 * @Version 1.0
 **/
@RestController("student")
@AllArgsConstructor
public class StudentController {

    private StudentService studentService;

    @RequestMapping("/getStudents")
    public List<Student> getStudents(){
        return studentService.selectAnnotationAll();
    }
}
