package com.jd.mapper;

import com.jd.domain.Order;
import com.jd.domain.Product;
import com.jd.query.OrderQuery;
import com.jd.query.ProductQuery;

import java.util.List;

public interface ProductMapper {
    List<Product> findAll() ;
    Product findOne(Long id);
    void add(Product product);
    void update(Product product);
    void delete(Long id);
    void delByCategoryId(Long category_id);
    List<Product> query(ProductQuery productQuery);
}
