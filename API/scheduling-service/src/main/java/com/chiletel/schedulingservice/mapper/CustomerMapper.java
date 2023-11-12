package com.chiletel.schedulingservice.mapper;

import com.chiletel.schedulingservice.dto.CustomerDTO;
import com.chiletel.schedulingservice.model.Customer;

public class CustomerMapper {

    public static CustomerDTO customerToCustomerDTO(Customer customer) {
        if (customer == null) {
            return null;
        }

        CustomerDTO customerDTO = new CustomerDTO();
        customerDTO.setCustomerId(customer.getCustomerId());
        customerDTO.setName(customer.getName());
        customerDTO.setAddress(customer.getAddress());
        customerDTO.setDistrict(customer.getDistrict());
        customerDTO.setType(customer.getType());
        customerDTO.setCreatedAt(customer.getCreatedAt());
        customerDTO.setUpdatedAt(customer.getUpdatedAt());

        return customerDTO;
    }

    public static Customer customerDTOToCustomer(CustomerDTO customerDTO) {
        if (customerDTO == null) {
            return null;
        }

        Customer customer = new Customer();
        customer.setCustomerId(customerDTO.getCustomerId());
        customer.setName(customerDTO.getName());
        customer.setAddress(customerDTO.getAddress());
        customer.setDistrict(customerDTO.getDistrict());
        customer.setType(customerDTO.getType());
        customer.setCreatedAt(customerDTO.getCreatedAt());
        customer.setUpdatedAt(customerDTO.getUpdatedAt());

        return customer;
    }
}
