package com.rems.yumPortal.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.rems.yumPortal.entities.Customer;
import com.rems.yumPortal.entities.Property;
import com.rems.yumPortal.service.CustomerService;
import com.rems.yumPortal.service.PropertyService;

@Controller
@SessionAttributes(names = "authToken")
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;

	@Autowired
	private PropertyService propertyService;

	@GetMapping("/customerPortal")
	public String goToCustomerPortal(HttpSession session) {
		String token = (String) session.getAttribute("authToken");
		System.out.println("***********" + token);
		return "customerPortal";
	}

	@GetMapping("/customerProperty")
	public String goToCustomerProperty(HttpSession session) {
		String token = (String) session.getAttribute("authToken");
		System.out.println("***********" + token);
		return "customerProperty";
	}

	@GetMapping("/addCustomerDetails")
	public String addCustomerDetails(HttpSession session) {
		String token = (String) session.getAttribute("authToken");
		System.out.println("***********" + token);
		return "addCustomerDetails";
	}

	@GetMapping("/addRequirements")
	public String addRequirements(Model model, HttpSession session) {
		String token = (String) session.getAttribute("authToken");
		System.out.println("***********" + token);
		int custId = 1;
		model.addAttribute("custId", custId);
		return "addRequirements";
	}

	@GetMapping("/myRequirements")
	public String myRequirements(Model model, HttpSession session) {
		int custId = 1;
		model.addAttribute("custId", custId);
		return "myRequirements";
	}

	@GetMapping("/customer/getAllProperties")
	public String getAllProperties(Model model, HttpSession session) {
		List<Property> properties = propertyService.getAllProperties();
		model.addAttribute("properties", properties);
		return "customerProperty";
	}

	@GetMapping("/customer/getAllPropertiesByType/{propertyType}")
	public String getAllPropertiesByType(String propertyType, Model model, HttpSession session) {
		List<Property> properties = propertyService.getAllPropertiesByType(propertyType);
		model.addAttribute("properties", properties);
		return "customerProperty";
	}

	@GetMapping("/customer/getAllPropertiesByLocality/{locality}")
	public String getAllPropertiesByLocality(String locality, Model model, HttpSession session) {
		List<Property> properties = propertyService.getAllPropertiesByLocality(locality);
		model.addAttribute("properties", properties);
		return "customerProperty";
	}

	@PostMapping("/customer/createCustomer")
	public String createCustomer(Customer customer, Model model, HttpSession session) {
		if (!(customerService.createCustomer(customer))) {
			model.addAttribute("errorMessage", "Customer  Already Exists!");
		} else {
			model.addAttribute("successMessage", "Customer Created Successfully!");
		}
		return "addCustomerDetails";
	}

	@GetMapping("/customer/getCustomerDetails")
	public String getCustomerById(@RequestParam("custid") String id, Model model, HttpSession session) {
		Customer cust = customerService.getCustomerById(id);
		if (cust == null) {
			model.addAttribute("message", "No Customer found with this ID!");
		} else {
			model.addAttribute("cust", cust);
			System.out.println("************ " + cust + " ************");
		}
		return "myRequirements";
	}

	@GetMapping("/customer/assignRequirements")
	public String assignRequirements(@RequestParam("customerId") String custid,

			@RequestParam("requirementId") String reqid, Model model, HttpSession session) {
		if (customerService.assignRequirements(custid, reqid)) {
			model.addAttribute("errorMessage", "Invalid Customer ID or Requirement ID!");
		} else {
			model.addAttribute("successMessage", "Assigned!");
		}
		return "addRequirements";
	}

	/*
	 * @PostMapping("/createCustomer") public String createCustomer(Customer
	 * customer,Model model) { if(!(customerService.createCustomer(customer))) {
	 * model.addAttribute("message", "Customer  Already Exists!"); } else {
	 * model.addAttribute("message", "Customer Created Successfully!"); } return
	 * "customer"; }
	 * 
	 * 
	 * 
	 * @GetMapping("/getAllCustomers") public String getAllCustomers(Model model) {
	 * List<Customer> customers = customerService.getAllCustomers();
	 * if(customers.isEmpty()) { model.addAttribute("message",
	 * "Customer List is empty!"); }else { model.addAttribute("customers",
	 * customers); } return "customer"; }
	 * 
	 * 
	 * 
	 * 
	 * @GetMapping("/customer/getAllRequirements") public String
	 * getAllRequirements(Model model) { List<Requirement> requirements =
	 * customerService.getAllRequirements(); model.addAttribute("requirements",
	 * requirements); return "customer"; }
	 * 
	 * 
	 * @GetMapping("/assignRequirements") public String
	 * assignRequirements(@RequestParam("customerId") String custid,
	 * 
	 * @RequestParam("requirementId") String reqid,Model model) {
	 * if(customerService.assignRequirements(custid, reqid)) {
	 * model.addAttribute("message", "Invalid Customer ID or Requirement ID!"); }
	 * else { model.addAttribute("message", "Assigned!"); } return "customer"; }
	 */
}
