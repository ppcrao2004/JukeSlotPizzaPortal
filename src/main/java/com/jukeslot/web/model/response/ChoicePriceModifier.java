package com.jukeslot.web.model.response;

import com.google.gson.annotations.SerializedName;

public class ChoicePriceModifier {
    public float fixed_amount;
    public float fixed_percentage;
    public float half_fixed_amount;
    public float half_fixed_percentage;
    public String type;

    public float getFixed_amount() {
        return fixed_amount;
    }

    public void setFixed_amount(float fixed_amount) {
        this.fixed_amount = fixed_amount;
    }

    public float getFixed_percentage() {
        return fixed_percentage;
    }

    public void setFixed_percentage(float fixed_percentage) {
        this.fixed_percentage = fixed_percentage;
    }

    public float getHalf_fixed_amount() {
        return half_fixed_amount;
    }

    public void setHalf_fixed_amount(float half_fixed_amount) {
        this.half_fixed_amount = half_fixed_amount;
    }

    public float getHalf_fixed_percentage() {
        return half_fixed_percentage;
    }

    public void setHalf_fixed_percentage(float half_fixed_percentage) {
        this.half_fixed_percentage = half_fixed_percentage;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
