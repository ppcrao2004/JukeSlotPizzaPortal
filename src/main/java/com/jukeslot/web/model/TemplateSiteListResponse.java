package com.jukeslot.web.model;

import com.jukeslot.web.model.response.TemplateResponse;
import org.apache.commons.lang3.builder.ToStringBuilder;

import java.util.List;

public class TemplateSiteListResponse {
    private String code;
    private List<TemplateResponse> data;

    public List<TemplateResponse> getData() {
        return data;
    }

    public void setData(List<TemplateResponse> data) {
        this.data = data;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
