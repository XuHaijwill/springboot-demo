package org.example.entity;

import com.baomidou.mybatisplus.annotation.FieldStrategy;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import lombok.Getter;
import lombok.Setter;
import org.example.base.BaseBizEntity;
import org.example.entity.bo.WalletBo;

@Getter
@Setter
@TableName(value = "t_user", autoResultMap = true)
public class UserEntity extends BaseBizEntity {

    private String username;

    private String password;

    @TableField(typeHandler = JacksonTypeHandler.class)
    private WalletBo wallet;

    @TableField(updateStrategy = FieldStrategy.IGNORED)
    private String syncTime;

}