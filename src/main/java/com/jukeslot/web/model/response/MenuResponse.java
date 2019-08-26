package com.jukeslot.web.model.response;

import java.util.List;

public class MenuResponse {
    public String site_id;
    public boolean active_item;
    public List<DayPeriodRes> days_and_period_active;
    public String description;
    public String id;
    public String image;
    public String create_time;
    public String title;
    public String update_time;
    public List<CategoryResponse> categories;
    public int category_count;
    public String company_code;
    public boolean has_category;
    public boolean has_item;
    public int item_count;
    public List<ItemResponse> items;
    public String major_code;
    public String minor_code;
    public String site_code;
    public String sub_code;

    public String getSite_id() {
        return site_id;
    }

    public void setSite_id(String site_id) {
        this.site_id = site_id;
    }

    public boolean isActive_item() {
        return active_item;
    }

    public void setActive_item(boolean active_item) {
        this.active_item = active_item;
    }

    public List<DayPeriodRes> getDays_and_period_active() {
        return days_and_period_active;
    }

    public void setDays_and_period_active(List<DayPeriodRes> days_and_period_active) {
        this.days_and_period_active = days_and_period_active;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }

    public List<CategoryResponse> getCategories() {
        return categories;
    }

    public void setCategories(List<CategoryResponse> categories) {
        this.categories = categories;
    }

    public int getCategory_count() {
        return category_count;
    }

    public void setCategory_count(int category_count) {
        this.category_count = category_count;
    }

    public String getCompany_code() {
        return company_code;
    }

    public void setCompany_code(String company_code) {
        this.company_code = company_code;
    }

    public boolean isHas_category() {
        return has_category;
    }

    public void setHas_category(boolean has_category) {
        this.has_category = has_category;
    }

    public boolean isHas_item() {
        return has_item;
    }

    public void setHas_item(boolean has_item) {
        this.has_item = has_item;
    }

    public int getItem_count() {
        return item_count;
    }

    public void setItem_count(int item_count) {
        this.item_count = item_count;
    }

    public List<ItemResponse> getItems() {
        return items;
    }

    public void setItems(List<ItemResponse> items) {
        this.items = items;
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

    public String getSite_code() {
        return site_code;
    }

    public void setSite_code(String site_code) {
        this.site_code = site_code;
    }

    public String getSub_code() {
        return sub_code;
    }

    public void setSub_code(String sub_code) {
        this.sub_code = sub_code;
    }
}
