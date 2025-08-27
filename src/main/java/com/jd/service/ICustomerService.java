package com.jd.service;

import com.jd.domain.Customer;

import java.util.List;

public interface ICustomerService {
    List<com.jd.domain.Customer> findAll();
    Customer findOne(Long id);
    void add(Customer customer);
    void update(Customer customer);
    void delete(Long id);

}
