package com.jukeslot.web.model;

import com.jukeslot.web.model.response.CompanyConfigurationRes;
import org.apache.commons.lang3.builder.ToStringBuilder;

public class CompanyConfigurationResponse {

    private String code;
    private CompanyConfigurationRes data;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public CompanyConfigurationRes getData() {
        return data;
    }

    public void setData(CompanyConfigurationRes data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
