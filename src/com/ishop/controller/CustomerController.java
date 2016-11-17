package com.ishop.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ishop.model.Customer;
import com.ishop.model.User;
import com.ishop.service.UserService;

/**
 * Handling customer related operations.
 * 
 * @author Jerry
 *
 */
@Controller
@RequestMapping("/customer")
@SessionAttributes("sessionUsername")
public class CustomerController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * Customer detail submission form.
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/info-form")
	public String showCustomerInfoForm(
			@ModelAttribute("sessionUsername") String username, 
			Model model) {
		
		model.addAttribute("customer", userService.getOrCreateCustomer(username));
		return "customer/customer-info-form";
	}
	
	@PostMapping("/info-form/submit")
	public String submitCustomerInfoForm(
			@Valid @ModelAttribute("customer") Customer customer, 
			BindingResult result, 
			@ModelAttribute("sessionUsername") String username) {
		
		if (result.hasErrors()) {
			return "customer/customer-info-form";
		}
		
		// Persist the Customer.
		userService.bindCustomer(username, customer);
		
		return "redirect:/customer/home";
	}
	
	@GetMapping("/home")
	public String showCustomerHomepage(
			@ModelAttribute("sessionUsername") String username, 
			Model model) {
		
		/*
		 * If no customer is bound to the user, simply redirect to customer 
		 * information form.
		 */
		if (!userService.isCustomerBoundToUser(username)) {
			return "redirect:/customer/info-form";
		}
		
		model.addAttribute("customer", userService.getCustomer(username));
		return "customer/customer-home";
	}
}