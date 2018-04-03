package com.niit.grocerystore.Frontend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.grocerystore.model.User;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home(@ModelAttribute("user")User user, Model model)
	{
		model.addAttribute("user", user);
		return "demo";
	}
	
	@RequestMapping("/category1")
	public String category1()
	{
		return "category1";
	}
  
	
	@RequestMapping("/dryfruits")
	public String dryfruits()
	{
		return "dryfruits";
	}
	
	@RequestMapping("/product1")
	public String product1()
	{
		return "product1";
	}
	
	@RequestMapping("/shipping")
	public String shipping()
	{
		return "shipping";
	}
	
	@RequestMapping("/supplier1")
	public String supplier1()
	{
		return "supplier1";
	}
	
	@RequestMapping("/singlepage")
	public String Singlepage()
	{
		return "Singlepage";
	}
}
