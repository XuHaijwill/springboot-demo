package org.example.entity;

import com.baomidou.mybatisplus.annotation.FieldStrategy;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import lombok.Getter;
import lombok.Setter;
import org.example.base.BaseBizEntity;
import org.example.entity.bo.WalletBo;

import javax.persistence.Transient;


@Getter
@Setter
@TableName(value = "t_user_2")
public class UserEntity extends BaseBizEntity {

    private String nickname;

    private String password;

    @TableField(typeHandler = JacksonTypeHandler.class,select=false)
    private WalletBo wallet;

    @TableField(updateStrategy = FieldStrategy.IGNORED,select=false)
    private String syncTime;

}