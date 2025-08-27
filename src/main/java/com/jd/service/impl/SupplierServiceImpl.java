package com.jd.service.impl;

import com.jd.domain.Supplier;
import com.jd.mapper.SupplierMapper;
import com.jd.service.ISupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * @author Long
 */
@Service
public class SupplierServiceImpl implements ISupplierService {
    @Autowired
    private SupplierMapper supplierMapper;
    @Override
    public List<Supplier> findAll() {
        return supplierMapper.findAll();
    }

    @Override
    public Supplier findOne(Long id) {
        return supplierMapper.findOne(id);
    }
    @Override
    public void add(Supplier supplier) {
        supplierMapper.add(supplier);
    }

    @Override
    public void update(Supplier supplier) {
        supplierMapper.update(supplier);
    }

    @Override
    public void delete(Long id) {
        supplierMapper.delete(id);
    }
}
