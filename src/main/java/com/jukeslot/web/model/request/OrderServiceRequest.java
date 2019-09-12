package com.jukeslot.web.model.request;

import com.jukeslot.web.model.response.HomePageResponse;
import org.apache.commons.lang3.builder.ToStringBuilder;

public class OrderServiceRequest {
    private String code;
    private HomePageResponse data;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public HomePageResponse getData() {
        return data;
    }

    public void setData(HomePageResponse data) {
        this.data = data;
    }
    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
