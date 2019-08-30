package com.jukeslot.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WelcomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
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

}
