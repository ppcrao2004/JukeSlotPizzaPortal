package com.jukeslot.web.model;

import com.jukeslot.web.model.response.CategoryResponse;
import com.jukeslot.web.model.response.CategoryServiceListResponse;
import org.apache.commons.lang3.builder.ToStringBuilder;

import java.util.List;

public class CategoryListMenuIDResp {
    private String code;
    private List<CategoryResponse> data;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public List<CategoryResponse> getData() {
        return data;
    }

    public void setData(List<CategoryResponse> data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
