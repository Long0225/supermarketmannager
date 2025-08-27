package com.jd.service.impl;

import com.jd.domain.Customer;
import com.jd.mapper.CustomerMapper;
import com.jd.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * @author Long
 */
@Service
public class CustomerServiceImpl implements ICustomerService {
    @Autowired
    private CustomerMapper customerMapper;
    @Override
    public List<Customer> findAll() {
        return customerMapper.findAll();
    }

    @Override
    public Customer findOne(Long id) {
        return customerMapper.findOne(id);
    }

    @Override
    public void add(Customer customer) {
        customerMapper.add(customer);
    }

    @Override
    public void update(Customer customer) {
        customerMapper.update(customer);
    }

    @Override
    public void delete(Long id) {
        customerMapper.delete(id);
    }
}
