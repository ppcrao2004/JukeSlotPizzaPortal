package com.jukeslot.web.model.response;

import java.util.List;

public class CalorieNutritionInfo {
    public String label_url;
    public List<Nutrition> nutrition_info_list;
    public String nutrition_description_info;
    public int serving_size;
    public String serving_unit_of_measure;
    public int total_calories;

    public String getLabel_url() {
        return label_url;
    }

    public void setLabel_url(String label_url) {
        this.label_url = label_url;
    }

    public List<Nutrition> getNutrition_info_list() {
        return nutrition_info_list;
    }

    public void setNutrition_info_list(List<Nutrition> nutrition_info_list) {
        this.nutrition_info_list = nutrition_info_list;
    }

    public String getNutrition_description_info() {
        return nutrition_description_info;
    }

    public void setNutrition_description_info(String nutrition_description_info) {
        this.nutrition_description_info = nutrition_description_info;
    }

    public int getServing_size() {
        return serving_size;
    }

    public void setServing_size(int serving_size) {
        this.serving_size = serving_size;
    }

    public String getServing_unit_of_measure() {
        return serving_unit_of_measure;
    }

    public void setServing_unit_of_measure(String serving_unit_of_measure) {
        this.serving_unit_of_measure = serving_unit_of_measure;
    }

    public int getTotal_calories() {
        return total_calories;
    }

    public void setTotal_calories(int total_calories) {
        this.total_calories = total_calories;
    }
}
