package com.jukeslot.web.model;
import com.google.gson.annotations.SerializedName;

public class TemplateResponse {
    public String background_color;
    public TemplateButton button;
    public String company_code;
    public String major_code;
    public String minor_code;
    public String sub_code;
    public String site_code;
    public String name;
    public DescriptionTextRes description_text;
    public String frame_color;
    public String id;
    public DescriptionTextRes price_text;
    public String layout;
    public String create_time;
    public String update_time;

    public String getBackground_color() {
        return background_color;
    }

    public void setBackground_color(String background_color) {
        this.background_color = background_color;
    }

    public TemplateButton getButton() {
        return button;
    }

    public void setButton(TemplateButton button) {
        this.button = button;
    }

    public String getCompany_code() {
        return company_code;
    }

    public void setCompany_code(String company_code) {
        this.company_code = company_code;
    }

    public String getMajor_code() {
        return major_code;
    }

    public void setMajor_code(String major_code) {
        this.major_code = major_code;
    }

    public String getMinor_code() {
        return minor_code;
    }

    public void setMinor_code(String minor_code) {
        this.minor_code = minor_code;
    }

    public String getSub_code() {
        return sub_code;
    }

    public void setSub_code(String sub_code) {
        this.sub_code = sub_code;
    }

    public String getSite_code() {
        return site_code;
    }

    public void setSite_code(String site_code) {
        this.site_code = site_code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public DescriptionTextRes getDescription_text() {
        return description_text;
    }

    public void setDescription_text(DescriptionTextRes description_text) {
        this.description_text = description_text;
    }

    public String getFrame_color() {
        return frame_color;
    }

    public void setFrame_color(String frame_color) {
        this.frame_color = frame_color;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public DescriptionTextRes getPrice_text() {
        return price_text;
    }

    public void setPrice_text(DescriptionTextRes price_text) {
        this.price_text = price_text;
    }

    public String getLayout() {
        return layout;
    }

    public void setLayout(String layout) {
        this.layout = layout;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }

    @Override
    public final String toString() {
        com.google.gson.Gson gson = new com.google.gson.GsonBuilder().setPrettyPrinting().create();
        return gson.toJson(this);
    }
}
