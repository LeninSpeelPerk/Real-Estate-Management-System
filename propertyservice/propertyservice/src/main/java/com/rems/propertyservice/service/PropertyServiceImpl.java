package com.rems.propertyservice.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rems.propertyservice.exception.PropertyTypeNotFoundException;
import com.rems.propertyservice.model.Property;
import com.rems.propertyservice.repository.PropertyRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PropertyServiceImpl implements PropertyService {

	@Autowired
	private PropertyRepository propertyRepo;

//	@Override
//	public void createProperty(Property property) {
//		propertyRepo.save(property);
//	}
	
	@Override
	public void createProperty(Property property) {
		Optional<Property> existingProperty = propertyRepo.findById(property.getId());

		if (existingProperty.isEmpty()) {
			propertyRepo.save(property);
			log.info("Property {} created", property.toString());
		} else {
			throw new PropertyTypeNotFoundException("Customer  Already Exists!");
		}

	}

	@Override
	public List<Property> getAllProperties() {
		List<Property> properties = propertyRepo.findAll();
		log.info("Properties: {}", properties);
		return properties;
	}

	@Override
	public List<Property> getAllPropertiesByType(String propertyType) {
		List<Property> properties = propertyRepo.findAllByPropertyType(propertyType);
		log.info("Properties with property type {}: {}", propertyType, properties);
		return properties;
	}

	@Override
	public List<Property> getAllPropertiesByLocality(String locality) {
		List<Property> properties = propertyRepo.findAllByLocality(locality);
		log.info("Properties in locality {}: {}", locality, properties);
		return properties;
	}

}
