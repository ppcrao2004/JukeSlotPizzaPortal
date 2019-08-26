package com.jukeslot.web.model;

import com.jukeslot.web.model.response.HomePageResponse;

public class HomePageResp {
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
}
