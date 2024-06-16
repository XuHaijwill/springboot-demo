package org.example.domain.entity;

import java.util.Date;

public class User2 {
    private Long id;

    private Date createDateTime;

    private Long createUserId;

    private String createUserName;

    private Date updateDateTime;

    private Long updateUserId;

    private String updateUserName;

    private Byte enabledState;

    private Byte deletedState;

    private String erwinId;

    private String password;

    private String phone;

    private String nickname;

    private Byte sex;

    private String avatar;

    private Byte lockedState;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getCreateDateTime() {
        return createDateTime;
    }

    public void setCreateDateTime(Date createDateTime) {
        this.createDateTime = createDateTime;
    }

    public Long getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Long createUserId) {
        this.createUserId = createUserId;
    }

    public String getCreateUserName() {
        return createUserName;
    }

    public void setCreateUserName(String createUserName) {
        this.createUserName = createUserName == null ? null : createUserName.trim();
    }

    public Date getUpdateDateTime() {
        return updateDateTime;
    }

    public void setUpdateDateTime(Date updateDateTime) {
        this.updateDateTime = updateDateTime;
    }

    public Long getUpdateUserId() {
        return updateUserId;
    }

    public void setUpdateUserId(Long updateUserId) {
        this.updateUserId = updateUserId;
    }

    public String getUpdateUserName() {
        return updateUserName;
    }

    public void setUpdateUserName(String updateUserName) {
        this.updateUserName = updateUserName == null ? null : updateUserName.trim();
    }

    public Byte getEnabledState() {
        return enabledState;
    }

    public void setEnabledState(Byte enabledState) {
        this.enabledState = enabledState;
    }

    public Byte getDeletedState() {
        return deletedState;
    }

    public void setDeletedState(Byte deletedState) {
        this.deletedState = deletedState;
    }

    public String getErwinId() {
        return erwinId;
    }

    public void setErwinId(String erwinId) {
        this.erwinId = erwinId == null ? null : erwinId.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public Byte getSex() {
        return sex;
    }

    public void setSex(Byte sex) {
        this.sex = sex;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar == null ? null : avatar.trim();
    }

    public Byte getLockedState() {
        return lockedState;
    }

    public void setLockedState(Byte lockedState) {
        this.lockedState = lockedState;
    }
}