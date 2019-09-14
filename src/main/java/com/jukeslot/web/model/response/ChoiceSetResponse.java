package com.jukeslot.web.model.response;

import com.google.gson.annotations.SerializedName;

import java.util.List;

public class ChoiceSetResponse {
    public boolean active_item;
    public List<String> choice_ids;
    public String choice_quantity;
    public List<Integer> choice_quantity_min_max;
    public String choice_set_name;
    public String choice_set_rules;
    public boolean print_choices_in_red;
    public String create_time;
    public String choiceId;
    public String image;
    public String kitchen_printer_name;
    public List<String> item_ids;
    public boolean not_required_for_jobs_marked_as_bartenders;
    public boolean persistent;
    public String type;
    public String updateTime;
    public String company_code;
    public String major_code;
    public String minor_code;
    public String sub_code;
    public String site_code;
    public String allow_choice_rule;
    public String choice_quantity_type;
    public String default_choice_id;
    public List<ChoiceResponse> choices;
    public boolean override_choice_pricing;
    public boolean prepend_choice_set_nan;
    public ChoicePriceModifier price_modifier;
    public String selected_rule;

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

    public String getChoice_quantity() {
        return choice_quantity;
    }

    public void setChoice_quantity(String choice_quantity) {
        this.choice_quantity = choice_quantity;
    }

    public List<Integer> getChoice_quantity_min_max() {
        return choice_quantity_min_max;
    }

    public void setChoice_quantity_min_max(List<Integer> choice_quantity_min_max) {
        this.choice_quantity_min_max = choice_quantity_min_max;
    }

    public String getChoice_set_name() {
        return choice_set_name;
    }

    public void setChoice_set_name(String choice_set_name) {
        this.choice_set_name = choice_set_name;
    }

    public String getChoice_set_rules() {
        return choice_set_rules;
    }

    public void setChoice_set_rules(String choice_set_rules) {
        this.choice_set_rules = choice_set_rules;
    }

    public boolean isPrint_choices_in_red() {
        return print_choices_in_red;
    }

    public void setPrint_choices_in_red(boolean print_choices_in_red) {
        this.print_choices_in_red = print_choices_in_red;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getChoiceId() {
        return choiceId;
    }

    public void setChoiceId(String choiceId) {
        this.choiceId = choiceId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getKitchen_printer_name() {
        return kitchen_printer_name;
    }

    public void setKitchen_printer_name(String kitchen_printer_name) {
        this.kitchen_printer_name = kitchen_printer_name;
    }

    public List<String> getItem_ids() {
        return item_ids;
    }

    public void setItem_ids(List<String> item_ids) {
        this.item_ids = item_ids;
    }

    public boolean isNot_required_for_jobs_marked_as_bartenders() {
        return not_required_for_jobs_marked_as_bartenders;
    }

    public void setNot_required_for_jobs_marked_as_bartenders(boolean not_required_for_jobs_marked_as_bartenders) {
        this.not_required_for_jobs_marked_as_bartenders = not_required_for_jobs_marked_as_bartenders;
    }

    public boolean isPersistent() {
        return persistent;
    }

    public void setPersistent(boolean persistent) {
        this.persistent = persistent;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
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

    public String getAllow_choice_rule() {
        return allow_choice_rule;
    }

    public void setAllow_choice_rule(String allow_choice_rule) {
        this.allow_choice_rule = allow_choice_rule;
    }

    public String getChoice_quantity_type() {
        return choice_quantity_type;
    }

    public void setChoice_quantity_type(String choice_quantity_type) {
        this.choice_quantity_type = choice_quantity_type;
    }

    public String getDefault_choice_id() {
        return default_choice_id;
    }

    public void setDefault_choice_id(String default_choice_id) {
        this.default_choice_id = default_choice_id;
    }

    public List<ChoiceResponse> getChoices() {
        return choices;
    }

    public void setChoices(List<ChoiceResponse> choices) {
        this.choices = choices;
    }

    public boolean isOverride_choice_pricing() {
        return override_choice_pricing;
    }

    public void setOverride_choice_pricing(boolean override_choice_pricing) {
        this.override_choice_pricing = override_choice_pricing;
    }

    public boolean isPrepend_choice_set_nan() {
        return prepend_choice_set_nan;
    }

    public void setPrepend_choice_set_nan(boolean prepend_choice_set_nan) {
        this.prepend_choice_set_nan = prepend_choice_set_nan;
    }

    public ChoicePriceModifier getPrice_modifier() {
        return price_modifier;
    }

    public void setPrice_modifier(ChoicePriceModifier price_modifier) {
        this.price_modifier = price_modifier;
    }

    public String getSelected_rule() {
        return selected_rule;
    }

    public void setSelected_rule(String selected_rule) {
        this.selected_rule = selected_rule;
    }
}
