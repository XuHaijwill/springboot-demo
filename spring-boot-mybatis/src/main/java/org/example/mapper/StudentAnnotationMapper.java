package org.example.mapper;

import org.apache.ibatis.annotations.*;
import org.example.domain.entity.Student;

import java.util.List;

/**
 * @ClassName StudentAnnotationMapper
 * @Description //TODO
 * @Author XuHaijwill
 * @Date 2024/1/1 9:54
 * @Version 1.0
 **/
public interface StudentAnnotationMapper {

    @Select("SELECT * FROM t_student where 1=1")
    @Results({
            @Result(property = "id",  column = "id", javaType = Integer.class),
            @Result(property = "name", column = "name"),
            @Result(property = "age", column = "age"),
            @Result(property = "classname", column = "classname")
    })
    List<Student> selectAll();


    @Insert("INSERT INTO t_student(name,age,classname) VALUES(#{name}, #{age}, #{classname})")
    int insert(Student student);

    @Update("UPDATE t_student SET name=#{name},age=#{age},classname=#{classname} WHERE id =#{id}")
    void update(Student student);

    @Delete("DELETE FROM t_student WHERE id =#{id}")
    void delete(Long id);
}
