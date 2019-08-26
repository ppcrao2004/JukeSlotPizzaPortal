package com.jukeslot.web.model.response;

public class FoodAllergenInfo {
    public String food_allergen_name;
    public String food_allergen_url;
    public String food_description_info;

    public String getFood_allergen_name() {
        return food_allergen_name;
    }

    public void setFood_allergen_name(String food_allergen_name) {
        this.food_allergen_name = food_allergen_name;
    }

    public String getFood_allergen_url() {
        return food_allergen_url;
    }

    public void setFood_allergen_url(String food_allergen_url) {
        this.food_allergen_url = food_allergen_url;
    }

    public String getFood_description_info() {
        return food_description_info;
    }

    public void setFood_description_info(String food_description_info) {
        this.food_description_info = food_description_info;
    }
}
