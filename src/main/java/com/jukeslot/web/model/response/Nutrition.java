package com.jukeslot.web.model.response;

public class Nutrition {
    public String name;
    public int percents;
    public String unit_of_measure;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPercents() {
        return percents;
    }

    public void setPercents(int percents) {
        this.percents = percents;
    }

    public String getUnit_of_measure() {
        return unit_of_measure;
    }

    public void setUnit_of_measure(String unit_of_measure) {
        this.unit_of_measure = unit_of_measure;
    }
}
