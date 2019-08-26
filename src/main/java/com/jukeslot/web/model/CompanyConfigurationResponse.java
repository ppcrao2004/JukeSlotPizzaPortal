package com.jukeslot.web.model;

import com.jukeslot.web.model.response.CompanyConfigurationRes;

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
}
