package com.recipe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class MainController {
	
	@RequestMapping(value="/main.do", method = RequestMethod.GET)
	public String join(Model model, HttpSession httpSession) {
		return "main"; 
	}
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String homeStart() {
		return "home";
	}
	
	@RequestMapping(value="/home.do", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value="/use.do", method = RequestMethod.GET)
	public String use() {
		return "use"; 
	}
	
	@RequestMapping(value="/makepeople.do", method = RequestMethod.GET)
	public String makepeople() {
		return "makepeople"; 
	}
	
	@RequestMapping(value="/new.do", method = RequestMethod.GET)
	public String newf() {
		return "NewFile"; 
	}
	
}