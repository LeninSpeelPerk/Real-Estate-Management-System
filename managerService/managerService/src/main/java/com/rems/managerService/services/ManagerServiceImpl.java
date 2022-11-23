package com.rems.managerService.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rems.managerService.clients.CustomerServiceClient;
import com.rems.managerService.exceptions.DuplicateExecutiveException;
import com.rems.managerService.model.Customer;
import com.rems.managerService.model.Executive;
import com.rems.managerService.repository.ExecutiveRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ExecutiveRepository executiveRepo;

	@Autowired
	private CustomerServiceClient customerClient;

//	@Override
//	public void createExecutive(Executive executive) {
//		executiveRepo.save(executive);
//	}
	
	@Override
	public String createExecutive(Executive executive) {
		Optional<Executive> existingExecutive = executiveRepo.findByName(executive.getName());
		
		if(existingExecutive.isEmpty()) {
			executiveRepo.save(executive);
			log.info("Exceutive {} created", executive.toString());
			return "Customer Created Successfully";
		}
		else	{
			throw new DuplicateExecutiveException("Executive  Already Exists!");
		}
	}

//	@Override
//	public Executive getExecutiveDetails(int id) {
//		Executive executive = executiveRepo.findById(id).get();
//		return executive;
//	}
	
	@Override
	public Executive getExecutiveDetails(int id) {
		Executive executive = null;
		Optional<Executive> exe = executiveRepo.findById(id);
		if (exe.isPresent()) {
			return exe.get();
		}
		log.info("Executive: {}", exe.toString());
		return executive;
	}

	@Override
	public List<Executive> getAllExecutives() {
		List<Executive> executives = executiveRepo.findAll();
		log.info("Exceutives: {}", executives);
		return executives;
	}

	@Override
	public List<Executive> getAllExecutivesByLocality(String locality) {
		List<Executive> executives = executiveRepo.findByLocality(locality);
		log.info("Exceutives with locality {}: {}", locality, executives);
		return executives;
	}

	@Override
	public List<Customer> getAllCustomers() {
		List<Customer> customers = customerClient.getAllCustomers();
		log.info("Customers: {}", customers);
		return customers;
	}

	@Override
	public Customer getCustomerById(int id) {
		Customer customer = customerClient.getCustomerById(id);
		log.info("Customer: {}", customer.toString());
		return customer;
	}

	@Override
	public void assignExecutive(int execid, int custid) {
		Executive executive = executiveRepo.findById(execid).get();
		Customer customer = customerClient.getCustomerById(custid);
		executive.getCustomers().add(customer);
		executiveRepo.save(executive);
		log.info("Customer with id {} assigned to Exceutive with id {}", custid, execid);
	}

//	@Override
//	public void assignExecutive(int execid, int custid) {
//		Customer cust = customerClient.getCustomerById(custid);
//		if(cust==null) {
//			Executive executive = executiveRepo.findById(execid).get();
//			Customer customer = customerClient.getCustomerById(custid);
//			executive.getCustomers().add(customer);
//			executiveRepo.save(executive);
//		}
//		else	{
//			throw new ExecutiveNotFoundException("Customer Not Found!");
//		}
//	}

}
