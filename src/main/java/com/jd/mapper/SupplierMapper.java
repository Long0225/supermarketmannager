package com.jd.mapper;

import com.jd.domain.Customer;
import com.jd.domain.Supplier;

import java.util.List;

public interface SupplierMapper {
    List<Supplier> findAll();
    Supplier findOne(Long id);
    void add(Supplier supplier);
    void update(Supplier supplier);
    void delete(Long id);
}
