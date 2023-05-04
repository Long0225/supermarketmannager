package com.jd.service.impl;

import com.jd.domain.Product;
import com.jd.mapper.ProductMapper;
import com.jd.query.ProductQuery;
import com.jd.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProductServiceImpl implements IProductService {
    @Autowired
    private ProductMapper productMapper;
    @Override
    public List<Product> findAll() {
        return productMapper.findAll();
    }

    @Override
    public Product findOne(Long id) {
        return productMapper.findOne(id);
    }

    @Override
    public void add(Product product) {
        productMapper.add(product);
    }

    @Override
    public void update(Product product) {
        productMapper.update(product);
    }

    @Override
    public void delete(Long id) {
        productMapper.delete(id);
    }

    @Override
    public void delByCategoryId(Long category_id) {
        productMapper.delByCategoryId(category_id);
    }

    @Override
    public List<Product> query(ProductQuery productQuery) {

        return productMapper.query(productQuery);
    }
}
