package com.chiletel.schedulingservice.controller;

import com.chiletel.schedulingservice.dto.CustomerDTO;
import com.chiletel.schedulingservice.mapper.CustomerMapper;
import com.chiletel.schedulingservice.model.Customer;
import com.chiletel.schedulingservice.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/scheduling-service/customers")
public class CustomerController {

    private final CustomerService customerService;

    @Autowired
    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @GetMapping
    public List<CustomerDTO> getAllCustomers() {
        return customerService.getAllCustomers().stream()
                .map(CustomerMapper::customerToCustomerDTO)
                .collect(Collectors.toList());
    }

    @GetMapping("/{id}")
    public ResponseEntity<CustomerDTO> getCustomerById(@PathVariable Long id) {
        return customerService.getCustomerById(id)
                .map(customer -> ResponseEntity.ok(CustomerMapper.customerToCustomerDTO(customer)))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public CustomerDTO createCustomer(@RequestBody CustomerDTO customerDTO) {
        Customer customer = customerService.saveCustomer(CustomerMapper.customerDTOToCustomer(customerDTO));
        return CustomerMapper.customerToCustomerDTO(customer);
    }

    @PutMapping("/{id}")
    public ResponseEntity<CustomerDTO> updateCustomer(@PathVariable Long id, @RequestBody CustomerDTO customerDTO) {
        return customerService.getCustomerById(id)
                .map(customer -> {
                    Customer updatedCustomer = CustomerMapper.customerDTOToCustomer(customerDTO);
                    updatedCustomer.setCustomerId(id); // Ensure the ID is set correctly for the update
                    updatedCustomer = customerService.saveCustomer(updatedCustomer);
                    return ResponseEntity.ok(CustomerMapper.customerToCustomerDTO(updatedCustomer));
                })
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCustomer(@PathVariable Long id) {
        customerService.deleteCustomer(id);
        return ResponseEntity.ok().build();
    }
}
