package com.jukeslot.web.model.response;

import com.google.gson.annotations.SerializedName;

import java.util.List;

public class ChoiceResponse {
    public String kitchen_print_name;
    public String site_code;
    public float choice_cost;
    public List<String> choice_set_ids;
    public String choice_sku;
    public String choiceName;
    public String create_time;
    public boolean has_sub_choice_set;
    public String id;
    public String image;
    public String name;
    public ChoicePriceModifier price_modifier;
    public boolean print;
    public String update_time;
    public boolean active_item;
    public String company_code;
    public String major_code;
    public String minor_code;
    public String sub_code;
    public List<ChoiceSetResponse> sub_choice_sets;
    public List<String> sub_choice_set_ids;
    public int amount;
    public float tax_rate;

    public String getKitchen_print_name() {
        return kitchen_print_name;
    }

    public void setKitchen_print_name(String kitchen_print_name) {
        this.kitchen_print_name = kitchen_print_name;
    }

    public String getSite_code() {
        return site_code;
    }

    public void setSite_code(String site_code) {
        this.site_code = site_code;
    }

    public float getChoice_cost() {
        return choice_cost;
    }

    public void setChoice_cost(float choice_cost) {
        this.choice_cost = choice_cost;
    }

    public List<String> getChoice_set_ids() {
        return choice_set_ids;
    }

    public void setChoice_set_ids(List<String> choice_set_ids) {
        this.choice_set_ids = choice_set_ids;
    }

    public String getChoice_sku() {
        return choice_sku;
    }

    public void setChoice_sku(String choice_sku) {
        this.choice_sku = choice_sku;
    }

    public String getChoiceName() {
        return choiceName;
    }

    public void setChoiceName(String choiceName) {
        this.choiceName = choiceName;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public boolean isHas_sub_choice_set() {
        return has_sub_choice_set;
    }

    public void setHas_sub_choice_set(boolean has_sub_choice_set) {
        this.has_sub_choice_set = has_sub_choice_set;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ChoicePriceModifier getPrice_modifier() {
        return price_modifier;
    }

    public void setPrice_modifier(ChoicePriceModifier price_modifier) {
        this.price_modifier = price_modifier;
    }

    public boolean isPrint() {
        return print;
    }

    public void setPrint(boolean print) {
        this.print = print;
    }

    public String getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }

    public boolean isActive_item() {
        return active_item;
    }

    public void setActive_item(boolean active_item) {
        this.active_item = active_item;
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

    public List<ChoiceSetResponse> getSub_choice_sets() {
        return sub_choice_sets;
    }

    public void setSub_choice_sets(List<ChoiceSetResponse> sub_choice_sets) {
        this.sub_choice_sets = sub_choice_sets;
    }

    public List<String> getSub_choice_set_ids() {
        return sub_choice_set_ids;
    }

    public void setSub_choice_set_ids(List<String> sub_choice_set_ids) {
        this.sub_choice_set_ids = sub_choice_set_ids;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public float getTax_rate() {
        return tax_rate;
    }

    public void setTax_rate(float tax_rate) {
        this.tax_rate = tax_rate;
    }
}
