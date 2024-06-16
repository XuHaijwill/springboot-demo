package org.example.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.example.domain.BaseEntity;

import java.util.Date;

/**
 * 用户对象 sys_user
 */
@Data
@TableName(value = "sys_user")
public class SysUser extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private Long userId;

    private Long deptId;

    private String userName;

    private String nickName;

    private String userType;

    private String email;

    private String phonenumber;

    private String sex;

    private String avatar;

    private String password;

    private String status;

    private String delFlag;

    private String loginIp;

    private Date loginDate;
}