package com.jukeslot.web.model;

import com.jukeslot.web.model.response.MenuResponse;
import org.apache.commons.lang3.builder.ToStringBuilder;

import java.util.List;

public class MenuResp {
    private String code;
    private List<MenuResponse> data;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public List<MenuResponse> getData() {
        return data;
    }

    public void setData(List<MenuResponse> data) {
        this.data = data;
    }
    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
