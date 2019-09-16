package com.jukeslot.web.model.request;

import com.jukeslot.web.model.response.HomePageResponse;
import com.jukeslot.web.model.response.Item;
import org.apache.commons.lang3.builder.ToStringBuilder;

import java.util.List;

public class OrderServiceRequest {

    public String client_id;
    public String order_type;
    public String payment_type;
    public String remark;
    public float tip_rate;
    public String site_code;
    public List<Item> items;

    public String getClient_id() {
        return client_id;
    }

    public void setClient_id(String client_id) {
        this.client_id = client_id;
    }

    public String getOrder_type() {
        return order_type;
    }

    public void setOrder_type(String order_type) {
        this.order_type = order_type;
    }

    public String getPayment_type() {
        return payment_type;
    }

    public void setPayment_type(String payment_type) {
        this.payment_type = payment_type;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public float getTip_rate() {
        return tip_rate;
    }

    public void setTip_rate(float tip_rate) {
        this.tip_rate = tip_rate;
    }

    public String getSite_code() {
        return site_code;
    }

    public void setSite_code(String site_code) {
        this.site_code = site_code;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
