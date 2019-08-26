package com.jukeslot.web.model.response;

import java.util.List;

public class CompanyConfigurationRes {

    public boolean active_company;
    public String address1;
    public String address2;
    public String city;
    public String country;
    public String claiming_tax_exempt_status;
    public String code;
    public List<CompanyContact> create_time;
    public String fax;
    public String image;
    public boolean corp_fed_tax_id;
    public String phone;
    public String postal_code;
    public String utilize_multi_site_structure;
    public String time_zone;
    public String state_province;
    public String website;

    public boolean isActive_company() {
        return active_company;
    }

    public void setActive_company(boolean active_company) {
        this.active_company = active_company;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getClaiming_tax_exempt_status() {
        return claiming_tax_exempt_status;
    }

    public void setClaiming_tax_exempt_status(String claiming_tax_exempt_status) {
        this.claiming_tax_exempt_status = claiming_tax_exempt_status;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public List<CompanyContact> getCreate_time() {
        return create_time;
    }

    public void setCreate_time(List<CompanyContact> create_time) {
        this.create_time = create_time;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean isCorp_fed_tax_id() {
        return corp_fed_tax_id;
    }

    public void setCorp_fed_tax_id(boolean corp_fed_tax_id) {
        this.corp_fed_tax_id = corp_fed_tax_id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPostal_code() {
        return postal_code;
    }

    public void setPostal_code(String postal_code) {
        this.postal_code = postal_code;
    }

    public String getUtilize_multi_site_structure() {
        return utilize_multi_site_structure;
    }

    public void setUtilize_multi_site_structure(String utilize_multi_site_structure) {
        this.utilize_multi_site_structure = utilize_multi_site_structure;
    }

    public String getTime_zone() {
        return time_zone;
    }

    public void setTime_zone(String time_zone) {
        this.time_zone = time_zone;
    }

    public String getState_province() {
        return state_province;
    }

    public void setState_province(String state_province) {
        this.state_province = state_province;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }
}
