package com.jukeslot.web.model;

import com.jukeslot.web.model.response.SiteConfigurationRes;
import org.apache.commons.lang3.builder.ToStringBuilder;

import java.util.List;

public class SiteConfigResponse {

    private String code;
    private SiteConfigurationRes data;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public SiteConfigurationRes getData() {
        return data;
    }

    public void setData(SiteConfigurationRes data) {
        this.data = data;
    }
    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
