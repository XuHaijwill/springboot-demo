package org.example.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
public class MyBatisPlusAutoFillMetaObjectHandler implements MetaObjectHandler {

    @Override
    public void insertFill(final MetaObject metaObject) {
        this.setFieldValByName("createDateTime", LocalDateTime.now(), metaObject);
    }

    @Override
    public void updateFill(final MetaObject metaObject) {
        this.setFieldValByName("updateDateTime", LocalDateTime.now(), metaObject);
    }
}
