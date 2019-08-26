package com.jukeslot.web.model.response;

public class ItemGroup {
    public boolean allow_coupons;
    public boolean allow_discounts;
    public String id;
    public String name;

    public boolean isAllow_coupons() {
        return allow_coupons;
    }

    public void setAllow_coupons(boolean allow_coupons) {
        this.allow_coupons = allow_coupons;
    }

    public boolean isAllow_discounts() {
        return allow_discounts;
    }

    public void setAllow_discounts(boolean allow_discounts) {
        this.allow_discounts = allow_discounts;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
