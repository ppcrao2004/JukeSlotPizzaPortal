package com.jukeslot.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WelcomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		return "selectSiteID";
	}
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public String welcome(ModelMap model) {
		return "welcome";
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String printWelcome1(ModelMap model) {
		return "checkout";
	}

	@RequestMapping(value = "/mainMenu", method = RequestMethod.GET)
	public String menu1(ModelMap model) {
		return "mainMenu";
	}

	@RequestMapping(value = "/reviewOrder", method = RequestMethod.GET)
	public String reviewOrder(ModelMap model) {
		return "reviewOrder";
	}
	@RequestMapping(value = "/orderReview", method = RequestMethod.GET)
	public String orderReview(ModelMap model) {
		return "orderReview";
	}
	@RequestMapping(value = "/paymentMethod", method = RequestMethod.GET)
	public String paymentMethod(ModelMap model) {
		return "paymentMethod";
	}

	@RequestMapping(value = "/summary", method = RequestMethod.GET)
	public String summary(ModelMap model) {
		return "summary";
	}
	@RequestMapping(value = "/personInfo", method = RequestMethod.GET)
	public String personInfo(ModelMap model) {
		return "personInfo";
	}
}
