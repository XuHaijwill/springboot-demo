package org.example.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.example.base.BaseEntity;

@Getter
@Setter
@Accessors(chain = true)
@TableName("t_log")
public class LogEntity extends BaseEntity {

    private String logKey;

    private String bizId;

    private String msg;

    private String data;

    private String error;

}
