package com.jd.mapper;


import com.jd.domain.Order;
import com.jd.query.OrderQuery;

import java.util.List;

public interface OrderMapper {
    List<Order> findAll() ;

    Order findOne(Long id);

    void add(Order order);

    void update(Order order);

    void delete(Long id);

    List<Order> query(OrderQuery orderQuery);
}
