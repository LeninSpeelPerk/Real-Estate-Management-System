package com.rems.yumPortal.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rems.yumPortal.entities.Customer;
import com.rems.yumPortal.entities.Executive;
import com.rems.yumPortal.entities.Property;
import com.rems.yumPortal.service.CustomerService;
import com.rems.yumPortal.service.ManagerService;
import com.rems.yumPortal.service.PropertyService;

@Controller
public class ExecutiveController {
	
	@Autowired
	private ManagerService executiveService;

	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private PropertyService propertyService;
	
	
	@GetMapping("/executivePortal")
	public String executivePortal() {
		return "executivePortal";
	}
	
	@GetMapping("/executiveProperty")
	public String goToProperty() {
		return "executiveProperty";
	}
	
	@GetMapping("/show/getCustomerDetails")
	public String executiveGetCustomerById() {
		return "executiveShowCustomerDetails";
	}
	
	@GetMapping("/showExecutiveProfile")
	public String showExecutiveProfile() {
		return "showExecutiveProfile";
	}
	
	@GetMapping("/executive/getAllProperties")
	public String getAllProperties(Model model) {
		List<Property> properties = propertyService.getAllProperties();
		model.addAttribute("properties", properties);
		return "executiveProperty";
	}
	
	@GetMapping("/executive/getAllPropertiesByType/{propertyType}")
	public String getAllPropertiesByType(String propertyType, Model model) {
		List<Property> properties = propertyService.getAllPropertiesByType(propertyType);
		model.addAttribute("properties", properties);
		return "executiveProperty";
	}

	@GetMapping("/executive/getAllPropertiesByLocality/{locality}")
	public String getAllPropertiesByLocality(String locality, Model model) {
		List<Property> properties = propertyService.getAllPropertiesByLocality(locality);
		model.addAttribute("properties", properties);
		return "executiveProperty";
	}

	
	@GetMapping("/executive/getExecutiveDetails")
	public String getExecutiveDetails(@RequestParam("execid") String id, Model model) {
		Executive executive = executiveService.getExecutiveDetails(id);
		if(executive == null) {
			model.addAttribute("message", "No Executive found with this ID!");
		}
		else {
			model.addAttribute("executive", executive);
		}
		
		return "showExecutiveProfile";
	}
	
//	@GetMapping("/executive/getCustomerDetails")
//	public String getCustomerById(@RequestParam("custid") String id, Model model) {
//		Customer customer = customerService.getCustomerById(id);
//		model.addAttribute("customer", customer);
//		System.out.println("************ " + customer + " ************");
//		return "executive";
//	}
	
	@GetMapping("/executive/getCustomerDetails")
	public String getCustomerById(@RequestParam("custid") String id, Model model) {
		Customer customer = customerService.getCustomerById(id);
		if(customer == null) {
			model.addAttribute("message", "No Customer found with this ID!");
		}
		else {
			model.addAttribute("customer", customer);
			System.out.println("************ " + customer + " ************");
		}
		return "executiveShowCustomerDetails";
	}
	
}
