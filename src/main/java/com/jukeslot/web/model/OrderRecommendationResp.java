package com.jukeslot.web.model;

import com.jukeslot.web.model.response.ItemResponse;
import org.apache.commons.lang3.builder.ToStringBuilder;

import java.util.List;

public class OrderRecommendationResp {
    private String code;
    private List<ItemResponse> data;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public List<ItemResponse> getData() {
        return data;
    }

    public void setData(List<ItemResponse> data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
