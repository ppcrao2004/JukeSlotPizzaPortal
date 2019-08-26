package com.jukeslot.web.model.response;

public class HomeImage {
    public String type;
    public DayPeriodRes days_and_period_active;
    public String image;
    public String name;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public DayPeriodRes getDays_and_period_active() {
        return days_and_period_active;
    }

    public void setDays_and_period_active(DayPeriodRes days_and_period_active) {
        this.days_and_period_active = days_and_period_active;
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
}
