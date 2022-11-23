package com.rems.yumPortal.entities;

import java.util.Set;

import javax.persistence.ElementCollection;

import lombok.Data;

@Data
public class Executive {

	public int id;
	public String name;
	public String contactNumber;
	public String locality;
	public String emailId;
	
	@ElementCollection
	private Set<Customer> customers;
	
	public Executive() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getLocality() {
		return locality;
	}

	public void setLocality(String locality) {
		this.locality = locality;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public Set<Customer> getCustomers() {
		return customers;
	}

	public void setCustomers(Set<Customer> customers) {
		this.customers = customers;
	}

	@Override
	public String toString() {
		return "Executive [id=" + id + ", name=" + name + ", contactNumber=" + contactNumber + ", locality=" + locality
				+ ", emailId=" + emailId + ", customers=" + customers + "]";
	}
}
