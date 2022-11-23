package com.rems.yumPortal.clients;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.rems.yumPortal.entities.Login;
import com.rems.yumPortal.entities.User;

@FeignClient(name = "authorization-service", url = "localhost:8085/auth")
public interface AuthenticationClient {
	

	@RequestMapping(value = "/authenticate",  method = RequestMethod.POST)
	public String createAuthenticationToken(@RequestBody Login authenticationRequest);
	
	@PostMapping("/register")
	public ResponseEntity<String> createNewUser(@RequestBody User user);
	
	@PostMapping("/getUser")
	public boolean getUser(@RequestParam("username") String username);
	
}