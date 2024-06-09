package com.ruoyi.common.utils;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;


import java.util.List;


/**
 * @ClassName CommonUtils
 * @Description //TODO
 * @Author XuHaijwill
 * @Date 2024/6/9 15:01
 * @Version 1.0
 **/
public class CommonUtils {
    private static final int DEFAULT_PAGE_NUM = 1;
    private static final int DEFAULT_PAGE_SIZE = 10;

    public static <T> JSONArray listToJsonArray(List<T> list) {
        return JSONArray.parseArray(JSON.toJSONString(list));
    }

    public static <T> JSONArray listToJsonArray(List<T> list, boolean formatDate) {
        return formatDate ? JSONArray.parseArray(JSON.toJSONString(list))
                : JSONArray.parseArray(JSON.toJSONString(list));
    }

}
