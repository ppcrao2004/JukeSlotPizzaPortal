package com.jukeslot.web.model;

import com.jukeslot.web.model.response.CategoryResponse;
import com.jukeslot.web.model.response.CategoryServiceListResponse;
import org.apache.commons.lang3.builder.ToStringBuilder;

import java.util.List;

public class CategoryListResp {
    private String code;
    private CategoryServiceListResponse data;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public CategoryServiceListResponse getData() {
        return data;
    }

    public void setData(CategoryServiceListResponse data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
