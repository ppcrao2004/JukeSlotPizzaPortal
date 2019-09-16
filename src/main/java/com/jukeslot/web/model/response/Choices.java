package com.jukeslot.web.model.response;

import com.google.gson.annotations.SerializedName;
import org.apache.commons.lang3.builder.ToStringBuilder;

public class Choices {
    public int amount;
    public String choice_id;
    public String choice_set_id;
    public String choice_set_type;
    public String extra;
    public String choice_name;
    public String create_time;
    public String update_time;
    public String item_id;
    public String order_id;
    public float price;

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getChoice_id() {
        return choice_id;
    }

    public void setChoice_id(String choice_id) {
        this.choice_id = choice_id;
    }

    public String getChoice_name() {
        return choice_name;
    }

    public void setChoice_name(String choice_name) {
        this.choice_name = choice_name;
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

    public String getItem_id() {
        return item_id;
    }

    public void setItem_id(String item_id) {
        this.item_id = item_id;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getChoice_set_id() {
        return choice_set_id;
    }

    public void setChoice_set_id(String choice_set_id) {
        this.choice_set_id = choice_set_id;
    }

    public String getChoice_set_type() {
        return choice_set_type;
    }

    public void setChoice_set_type(String choice_set_type) {
        this.choice_set_type = choice_set_type;
    }

    public String getExtra() {
        return extra;
    }

    public void setExtra(String extra) {
        this.extra = extra;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
