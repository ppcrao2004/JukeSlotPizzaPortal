package com.jukeslot.web.model.response;

public class DayPeriodRes {
    public String date;
    public DayOfWeekPeriod days_of_the_week;
    public Period period;
    public String repeat;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public DayOfWeekPeriod getDays_of_the_week() {
        return days_of_the_week;
    }

    public void setDays_of_the_week(DayOfWeekPeriod days_of_the_week) {
        this.days_of_the_week = days_of_the_week;
    }

    public Period getPeriod() {
        return period;
    }

    public void setPeriod(Period period) {
        this.period = period;
    }

    public String getRepeat() {
        return repeat;
    }

    public void setRepeat(String repeat) {
        this.repeat = repeat;
    }
}
