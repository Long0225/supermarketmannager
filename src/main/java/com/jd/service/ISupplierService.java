package com.jd.service;

import com.jd.domain.Supplier;


import java.util.List;

public interface ISupplierService {

    List<Supplier> findAll();

    Supplier findOne(Long id);

    void add(Supplier supplier);

    void update(Supplier supplier);

    void delete(Long id);
}
