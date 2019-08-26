package com.jukeslot.web.model.response;

import com.google.gson.annotations.SerializedName;

import java.util.ArrayList;
import java.util.List;

public class ItemResponse {

    public boolean active_item;
    public List<String> alerts;
    public String alternative_kitchen_print_name;
    public List<DayPeriodRes> days_and_period_active;
    public ArrayList<String> category_ids;
    public CalorieNutritionInfo calorie_nutrition_info;
    public String cost_unit_of_measure;
    public String default_tax_code;
    public String description;
    public boolean has_unique_price;
    public String goodId;
    public String image;
    public float item_cost;
    public String item_group_id;
    public String item_sku;
    public String override_tax_code;
    public float price;
    public String revenue_class_id;
    public String sales_unit_of_measure;
    public String tax_exempt;
    public String title;
    public long create_time;
    public long update_time;
    public List<ChoiceSetResponse> choice_sets;
    public String company_code;
    public List<FoodAllergenInfo> food_allergen_info_list;
    public boolean has_choice_set;
    public boolean has_modifier;
    public String major_code;
    public List<String> menu_ids;
    public String minor_code;
    public List<ModifierResponse> modifiers;
    public boolean name_tagging;
    public boolean pizza_logic;
    public boolean print;
    public String site_code;
    public List<String> spicy_levels;
    public String sub_code;
    public float tax_rate;

    public boolean isActive_item() {
        return active_item;
    }

    public void setActive_item(boolean active_item) {
        this.active_item = active_item;
    }

    public List<String> getAlerts() {
        return alerts;
    }

    public void setAlerts(List<String> alerts) {
        this.alerts = alerts;
    }

    public String getAlternative_kitchen_print_name() {
        return alternative_kitchen_print_name;
    }

    public void setAlternative_kitchen_print_name(String alternative_kitchen_print_name) {
        this.alternative_kitchen_print_name = alternative_kitchen_print_name;
    }

    public List<DayPeriodRes> getDays_and_period_active() {
        return days_and_period_active;
    }

    public void setDays_and_period_active(List<DayPeriodRes> days_and_period_active) {
        this.days_and_period_active = days_and_period_active;
    }

    public ArrayList<String> getCategory_ids() {
        return category_ids;
    }

    public void setCategory_ids(ArrayList<String> category_ids) {
        this.category_ids = category_ids;
    }

    public CalorieNutritionInfo getCalorie_nutrition_info() {
        return calorie_nutrition_info;
    }

    public void setCalorie_nutrition_info(CalorieNutritionInfo calorie_nutrition_info) {
        this.calorie_nutrition_info = calorie_nutrition_info;
    }

    public String getCost_unit_of_measure() {
        return cost_unit_of_measure;
    }

    public void setCost_unit_of_measure(String cost_unit_of_measure) {
        this.cost_unit_of_measure = cost_unit_of_measure;
    }

    public String getDefault_tax_code() {
        return default_tax_code;
    }

    public void setDefault_tax_code(String default_tax_code) {
        this.default_tax_code = default_tax_code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isHas_unique_price() {
        return has_unique_price;
    }

    public void setHas_unique_price(boolean has_unique_price) {
        this.has_unique_price = has_unique_price;
    }

    public String getGoodId() {
        return goodId;
    }

    public void setGoodId(String goodId) {
        this.goodId = goodId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getItem_cost() {
        return item_cost;
    }

    public void setItem_cost(float item_cost) {
        this.item_cost = item_cost;
    }

    public String getItem_group_id() {
        return item_group_id;
    }

    public void setItem_group_id(String item_group_id) {
        this.item_group_id = item_group_id;
    }

    public String getItem_sku() {
        return item_sku;
    }

    public void setItem_sku(String item_sku) {
        this.item_sku = item_sku;
    }

    public String getOverride_tax_code() {
        return override_tax_code;
    }

    public void setOverride_tax_code(String override_tax_code) {
        this.override_tax_code = override_tax_code;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getRevenue_class_id() {
        return revenue_class_id;
    }

    public void setRevenue_class_id(String revenue_class_id) {
        this.revenue_class_id = revenue_class_id;
    }

    public String getSales_unit_of_measure() {
        return sales_unit_of_measure;
    }

    public void setSales_unit_of_measure(String sales_unit_of_measure) {
        this.sales_unit_of_measure = sales_unit_of_measure;
    }

    public String getTax_exempt() {
        return tax_exempt;
    }

    public void setTax_exempt(String tax_exempt) {
        this.tax_exempt = tax_exempt;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public long getCreate_time() {
        return create_time;
    }

    public void setCreate_time(long create_time) {
        this.create_time = create_time;
    }

    public long getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(long update_time) {
        this.update_time = update_time;
    }

    public List<ChoiceSetResponse> getChoice_sets() {
        return choice_sets;
    }

    public void setChoice_sets(List<ChoiceSetResponse> choice_sets) {
        this.choice_sets = choice_sets;
    }

    public String getCompany_code() {
        return company_code;
    }

    public void setCompany_code(String company_code) {
        this.company_code = company_code;
    }

    public List<FoodAllergenInfo> getFood_allergen_info_list() {
        return food_allergen_info_list;
    }

    public void setFood_allergen_info_list(List<FoodAllergenInfo> food_allergen_info_list) {
        this.food_allergen_info_list = food_allergen_info_list;
    }

    public boolean isHas_choice_set() {
        return has_choice_set;
    }

    public void setHas_choice_set(boolean has_choice_set) {
        this.has_choice_set = has_choice_set;
    }

    public boolean isHas_modifier() {
        return has_modifier;
    }

    public void setHas_modifier(boolean has_modifier) {
        this.has_modifier = has_modifier;
    }

    public String getMajor_code() {
        return major_code;
    }

    public void setMajor_code(String major_code) {
        this.major_code = major_code;
    }

    public List<String> getMenu_ids() {
        return menu_ids;
    }

    public void setMenu_ids(List<String> menu_ids) {
        this.menu_ids = menu_ids;
    }

    public String getMinor_code() {
        return minor_code;
    }

    public void setMinor_code(String minor_code) {
        this.minor_code = minor_code;
    }

    public List<ModifierResponse> getModifiers() {
        return modifiers;
    }

    public void setModifiers(List<ModifierResponse> modifiers) {
        this.modifiers = modifiers;
    }

    public boolean isName_tagging() {
        return name_tagging;
    }

    public void setName_tagging(boolean name_tagging) {
        this.name_tagging = name_tagging;
    }

    public boolean isPizza_logic() {
        return pizza_logic;
    }

    public void setPizza_logic(boolean pizza_logic) {
        this.pizza_logic = pizza_logic;
    }

    public boolean isPrint() {
        return print;
    }

    public void setPrint(boolean print) {
        this.print = print;
    }

    public String getSite_code() {
        return site_code;
    }

    public void setSite_code(String site_code) {
        this.site_code = site_code;
    }

    public List<String> getSpicy_levels() {
        return spicy_levels;
    }

    public void setSpicy_levels(List<String> spicy_levels) {
        this.spicy_levels = spicy_levels;
    }

    public String getSub_code() {
        return sub_code;
    }

    public void setSub_code(String sub_code) {
        this.sub_code = sub_code;
    }

    public float getTax_rate() {
        return tax_rate;
    }

    public void setTax_rate(float tax_rate) {
        this.tax_rate = tax_rate;
    }
}
