package com.rems.yumPortal.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Login {
	
	public String userid;
	public String username;
	public String password;
	public String role;
	
}
