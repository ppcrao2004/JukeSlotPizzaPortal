package com.jukeslot.web.model;

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
    public final String toString() {
        com.google.gson.Gson gson = new com.google.gson.GsonBuilder().setPrettyPrinting().create();
        return gson.toJson(this);
    }
}
