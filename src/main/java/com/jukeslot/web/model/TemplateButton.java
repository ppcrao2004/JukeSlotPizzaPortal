package com.jukeslot.web.model;

public class TemplateButton {
    public String background_color;
    public String text_color;

    public String getBackground_color() {
        return background_color;
    }

    public void setBackground_color(String background_color) {
        this.background_color = background_color;
    }

    public String getText_color() {
        return text_color;
    }

    public void setText_color(String text_color) {
        this.text_color = text_color;
    }

    @Override
    public final String toString() {
        com.google.gson.Gson gson = new com.google.gson.GsonBuilder().setPrettyPrinting().create();
        return gson.toJson(this);
    }
}
