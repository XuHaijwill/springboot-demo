package org.example.model;

import java.math.BigDecimal;
import java.util.Date;

public class Goods {
    private Long id;

    private Date createDateTime;

    private Long createUserId;

    private String createUserName;

    private Date updateDateTime;

    private Long updateUserId;

    private String updateUserName;

    private Byte enabledState;

    private Byte deletedState;

    private String name;

    private BigDecimal price;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}