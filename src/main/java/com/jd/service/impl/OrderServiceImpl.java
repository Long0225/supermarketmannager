package com.jd.service.impl;

import com.jd.domain.Order;
import com.jd.mapper.OrderMapper;
import com.jd.query.OrderQuery;
import com.jd.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class OrderServiceImpl implements IOrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Override
    public List<Order> findAll() {
        return orderMapper.findAll();
    }

    @Override
    public Order findOne(Long id) {

        return orderMapper.findOne(id);
    }

    @Override
    public void add(Order order) {
        orderMapper.add(order);
    }

    @Override
    public void update(Order order) {
        orderMapper.update(order);
    }

    @Override
    public void delete(Long id) {
        orderMapper.delete(id);
    }

    @Override
    public List<Order> query(OrderQuery orderQuery) {

            return orderMapper.query(orderQuery);

    }


}
