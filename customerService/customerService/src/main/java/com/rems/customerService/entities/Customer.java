package com.rems.customerService.entities;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "customer")
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@NotNull(message = "Customer name cannot be null")
	private String name;
	@NotEmpty(message = "Address must not be empty")
	private String address;
	@NotNull(message = "Email Id cannot be null")
	@Email(message = "Invalid Email Entered")
	private String emailId;
	@NotNull(message = "Contact Number cannot be null")
	private String contactNumber;

	@OneToMany
	private Set<Requirement> requirements;
}
