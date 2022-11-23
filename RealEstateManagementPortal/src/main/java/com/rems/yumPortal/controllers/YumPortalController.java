package com.rems.yumPortal.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.rems.yumPortal.clients.AuthenticationClient;
import com.rems.yumPortal.entities.Login;
import com.rems.yumPortal.entities.User;

@Controller
@SessionAttributes(names = "authToken")
public class YumPortalController {

	@Autowired
	public AuthenticationClient client;

	@GetMapping("/login")
	public String goToLogin() {
		return "login";
	}

	@GetMapping("/logout")
	public String goToLogout(HttpSession session) {
		session.invalidate();
		return "app";
	}

	@GetMapping("/gotoregister")
	public String goToRegister(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "registerF";
	}

//	@PostMapping("/register")
//	public String register(@ModelAttribute User user, Model model) {
//		ResponseEntity<String> resp = client.saveUser(user);
//		if()
//	}
//	

//	@GetMapping("/gotoregister")
//	public String gotoRegister(Model model) {
//		User user = new User();
//		model.addAttribute("user",user);
//		return "register";
//	}

	@PostMapping("/register")
	public String register(@ModelAttribute User user, Model model) {

		ResponseEntity<String> resp = client.createNewUser(user);

		System.out.println(resp.getBody().toString());
		if (resp.getStatusCodeValue() == 201) {
//			model.addAttribute("message", "Succcessly registered! Login now");
			user.setUsername(null);
			user.setPassword(null);
			return "user";
		} else {
//			model.addAttribute("message", "Not Succcessly registered! Register again");

			return "registerF";
		}
	}

	@GetMapping("/app")
	public String landingPage() {
		return "app";
	}
//	
//	@GetMapping("/register")
//	public String goToRegister() {
//		return "register";
//	}

	@GetMapping("/user")
	public String goToUser() {
		return "user";
	}

	@GetMapping("/executivelogin")
	public ModelAndView employeeLogin(@RequestParam(defaultValue = "") String msg, Model model) {
		model.addAttribute("role", "Executive");
		model.addAttribute("msg", msg);
		model.addAttribute("login", new Login());
		return new ModelAndView("login");
	}

	@GetMapping("/customerlogin")
	public ModelAndView customerLogin(@RequestParam(defaultValue = "") String msg, Model model) {
		model.addAttribute("role", "Customer");
		model.addAttribute("msg", msg);
		model.addAttribute("login", new Login());
		return new ModelAndView("login");
	}

	@GetMapping("/managerlogin")
	public ModelAndView managerLogin(@RequestParam(defaultValue = "") String msg, Model model) {
		model.addAttribute("role", "Manager");
		model.addAttribute("msg", msg);
		model.addAttribute("login", new Login());
		return new ModelAndView("login");
	}

//	@PostMapping("/login")
//	public String goToLogin(@ModelAttribute("login") Login login, HttpSession session) {
//		System.out.println("*****" + login);
//		String authToken = client.createAuthenticationToken(login);
//		/* String authToken = resp.getBody().toString(); */
//		System.out.println(authToken);
//		session.setAttribute("username", login.getUsername());
//		session.setAttribute("authToken", authToken);
//		return "managerPortal";	
//	}

//	@PostMapping("/login")
//	public String goToLogin(@ModelAttribute("login") Login login, HttpSession session) {
//		System.out.println("*****" + login);
//		if (login.getRole().equals("Manager")) {
//			String authToken = client.createAuthenticationToken(login);
//			session.setAttribute("authToken", authToken);
//			System.out.println(authToken);
//			return "managerPortal";
//		} else if (login.getRole().equals("Customer")) {
//			return "customerPortal";
//		} else if (login.getRole().equals("Executive")) {
//			return "executivePortal";
//		} else {
//			return "user";
//		}
//	}

//	@PostMapping("/login")
//	public String goToLogin(@ModelAttribute("login") Login login, HttpSession session) {
////		String authToken = client.createAuthenticationToken(login);
//		System.out.println("*****" + login);
//		if (login.getRole().equals("Manager")) {
//			return "managerPortal";
//		} else if (login.getRole().equals("Customer")) {
//			return "customerPortal";
//		} else if (login.getRole().equals("Executive")) {
//			return "executivePortal";
//		} else {
//			return "user";
//		}
//	}
	
	@PostMapping("/login")
	public String goToLogin(@ModelAttribute("login") Login login, @RequestParam("username") String username,
			Model model, HttpSession session) { // String authToken = client.createAuthenticationToken(login);
		System.out.println("***" + login);
		if (login.getRole().equals("Manager")) {
			System.out.println(client.getUser(username));
			if (client.getUser(username)) {
				return "managerPortal";
			} else {
				model.addAttribute("message", "Invalid Credentials");
				return "login";
			}

		} else if (login.getRole().equals("Customer")) {
			
			System.out.println(client.getUser(username));
			if (client.getUser(username)) {
				return "customerPortal";
			} else {
				model.addAttribute("message", "Invalid Credentials");
				return "login";
			}
		} else if (login.getRole().equals("Executive")) {
			System.out.println(client.getUser(username));
			if (client.getUser(username)) {
				return "executivePortal";
			} else {
				model.addAttribute("message", "Invalid Credentials");
				return "login";
			}
			
		} else {
			return "user";
		}
	}
}
