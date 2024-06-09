package com.ruoyi.common.utils;
import com.alibaba.fastjson2.JSONArray;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.io.Serializable;
import java.util.List;


/**
 * @ClassName PageInfo
 * @Description //TODO
 * @Author XuHaijwill
 * @Date 2024/6/9 15:00
 * @Version 1.0
 **/
public class PageInfo<T> implements Serializable {
    private JSONArray records;
    private long total;
    private long pageSize;
    private long current;

    public <T> PageInfo(List<T> list) {
    }

    public void setPageInfo(IPage<T> page) {
        this.total = page.getTotal();
        this.pageSize = page.getSize();
        this.current = page.getCurrent();
        this.records = CommonUtils.listToJsonArray(page.getRecords());
    }

    public JSONArray getRecords() {
        return records;
    }

    public void setRecords(JSONArray records) {
        this.records = records;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public long getPageSize() {
        return pageSize;
    }

    public void setPageSize(long pageSize) {
        this.pageSize = pageSize;
    }

    public long getCurrent() {
        return current;
    }

    public void setCurrent(long current) {
        this.current = current;
    }
}
