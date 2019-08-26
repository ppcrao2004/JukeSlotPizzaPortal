package com.jukeslot.web.model.response;

public class DescriptionTextRes {
    public boolean bold;
    public String font_family;
    public int font_size;
    public boolean italic;
    public boolean underscored;

    public boolean isBold() {
        return bold;
    }

    public void setBold(boolean bold) {
        this.bold = bold;
    }

    public String getFont_family() {
        return font_family;
    }

    public void setFont_family(String font_family) {
        this.font_family = font_family;
    }

    public int getFont_size() {
        return font_size;
    }

    public void setFont_size(int font_size) {
        this.font_size = font_size;
    }

    public boolean isItalic() {
        return italic;
    }

    public void setItalic(boolean italic) {
        this.italic = italic;
    }

    public boolean isUnderscored() {
        return underscored;
    }

    public void setUnderscored(boolean underscored) {
        this.underscored = underscored;
    }
}
