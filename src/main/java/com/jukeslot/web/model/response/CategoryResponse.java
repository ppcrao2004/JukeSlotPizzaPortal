package com.jukeslot.web.model.response;

import java.util.List;

public class CategoryResponse {
    public boolean active_item;
    public List<DayPeriodRes> days_and_period_active;
    public String description;
    public String id;
    public String image;
    public List<String> menu_ids;
    public String title;
    public String create_time;
    public String update_time;
    public List<String> alerts;
    public String category_id;
    public String company_code;
    public boolean has_sub_category;
    public int item_count;
    public List<ItemResponse> items;
    public String major_code;
    public String minor_code;
    public String site_code;
    public String sub_code;
    public List<CategoryResponse> sub_categories;

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

    public List<String> getMenu_ids() {
        return menu_ids;
    }

    public void setMenu_ids(List<String> menu_ids) {
        this.menu_ids = menu_ids;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public List<String> getAlerts() {
        return alerts;
    }

    public void setAlerts(List<String> alerts) {
        this.alerts = alerts;
    }

    public String getCategory_id() {
        return category_id;
    }

    public void setCategory_id(String category_id) {
        this.category_id = category_id;
    }

    public String getCompany_code() {
        return company_code;
    }

    public void setCompany_code(String company_code) {
        this.company_code = company_code;
    }

    public boolean isHas_sub_category() {
        return has_sub_category;
    }

    public void setHas_sub_category(boolean has_sub_category) {
        this.has_sub_category = has_sub_category;
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

    public List<CategoryResponse> getSub_categories() {
        return sub_categories;
    }

    public void setSub_categories(List<CategoryResponse> sub_categories) {
        this.sub_categories = sub_categories;
    }
}
