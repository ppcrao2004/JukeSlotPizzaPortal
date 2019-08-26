package com.jukeslot.web.model.response;

import com.google.gson.annotations.SerializedName;

import java.util.List;

public class ModifierResponse {
    public boolean active_item;
    public List<String> choice_ids;
    public List<String> choice_set_ids;
    public List<ChoiceSetResponse> choice_sets;
    public List<ChoiceResponse> choices;
    public String company_code;
    public String create_time;
    public String heading;
    public String id;
    public String image;
    public List<String> item_ids;
    public String major_code;
    public String minor_code;
    public String modifier_screen_type;
    public int number_of_options;
    public String screen_title;
    public String site_code;
    public String sub_code;
    public String update_time;

    public boolean isActive_item() {
        return active_item;
    }

    public void setActive_item(boolean active_item) {
        this.active_item = active_item;
    }

    public List<String> getChoice_ids() {
        return choice_ids;
    }

    public void setChoice_ids(List<String> choice_ids) {
        this.choice_ids = choice_ids;
    }

    public List<String> getChoice_set_ids() {
        return choice_set_ids;
    }

    public void setChoice_set_ids(List<String> choice_set_ids) {
        this.choice_set_ids = choice_set_ids;
    }

    public List<ChoiceSetResponse> getChoice_sets() {
        return choice_sets;
    }

    public void setChoice_sets(List<ChoiceSetResponse> choice_sets) {
        this.choice_sets = choice_sets;
    }

    public List<ChoiceResponse> getChoices() {
        return choices;
    }

    public void setChoices(List<ChoiceResponse> choices) {
        this.choices = choices;
    }

    public String getCompany_code() {
        return company_code;
    }

    public void setCompany_code(String company_code) {
        this.company_code = company_code;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getHeading() {
        return heading;
    }

    public void setHeading(String heading) {
        this.heading = heading;
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

    public List<String> getItem_ids() {
        return item_ids;
    }

    public void setItem_ids(List<String> item_ids) {
        this.item_ids = item_ids;
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

    public String getModifier_screen_type() {
        return modifier_screen_type;
    }

    public void setModifier_screen_type(String modifier_screen_type) {
        this.modifier_screen_type = modifier_screen_type;
    }

    public int getNumber_of_options() {
        return number_of_options;
    }

    public void setNumber_of_options(int number_of_options) {
        this.number_of_options = number_of_options;
    }

    public String getScreen_title() {
        return screen_title;
    }

    public void setScreen_title(String screen_title) {
        this.screen_title = screen_title;
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

    public String getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }
}
