package com.chiletel.usermanagementservice.service;

import com.chiletel.usermanagementservice.model.Customer;
import com.chiletel.usermanagementservice.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CustomerService {

    private final CustomerRepository customerRepository;

    @Autowired
    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    public List<Customer> getAllCustomers() {
        return customerRepository.findAll();
    }

    public Optional<Customer> getCustomerById(Long id) {
        return customerRepository.findById(id);
    }

    public Customer saveCustomer(Customer customer) {
        return customerRepository.save(customer);
    }

    public Customer updateCustomer(Long id, Customer customer) {
        return customerRepository.findById(id)
                .map(existingCustomer -> {
                    existingCustomer.setName(customer.getName());
                    existingCustomer.setAddress(customer.getAddress());
                    existingCustomer.setDistrict(customer.getDistrict());
                    existingCustomer.setType(customer.getType());
                    // createdAt should not be updated
                    existingCustomer.setUpdatedAt(customer.getUpdatedAt());
                    return customerRepository.save(existingCustomer);
                }).orElseGet(() -> {
                    customer.setCustomerId(id);
                    return customerRepository.save(customer);
                });
    }

    public void deleteCustomer(Long id) {
        customerRepository.deleteById(id);
    }
}
