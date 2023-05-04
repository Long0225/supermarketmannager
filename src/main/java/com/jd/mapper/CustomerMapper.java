package com.jd.mapper;

import com.jd.domain.Customer;

import java.util.List;

public interface CustomerMapper {

    List<Customer> findAll();

    Customer findOne(Long id);

    void add(Customer customer);

    void update(Customer customer);

    void delete(Long id);








}
