package com.jd.controller;

import com.jd.domain.Customer;
import com.jd.domain.Order;
import com.jd.query.OrderQuery;
import com.jd.service.ICustomerService;
import com.jd.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author Long
 * 顾客接口
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private IOrderService orderService;
    @Autowired
    private ICustomerService customerService;


    /**
     * 列表数据
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String list(Model model){
        List<Order> orders = orderService.findAll();
        model.addAttribute("orders",orders);
        return "order_list";  // /templates/   order_list   .html
    }


    /**
     * 删除功能
     * @param
     * @return
     */
    @RequestMapping("/del")
    public String del(Long id){
        orderService.delete(id);
        return "redirect:list";
    }

    /**
     * 查看单个对象数据
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/view")
    public String view(Long id,Model model){
        Order order = orderService.findOne(id);
        model.addAttribute("order",order);
        return "order_view";
    }

    /**
     * 跳转到添加页面
     * @return
     */
    @RequestMapping("/toAdd")
    public String toAdd(Model model){
        List<Customer> customers = customerService.findAll();
        model.addAttribute("customers",customers);
        return "order_add";
    }

    /**
     * 跳转到修改页面 - 做数据回显
     * @return
     */
    @RequestMapping ("/toUpdate")
    public String toUpdate(Long id,Model model){
        Order order = orderService.findOne(id);
        model.addAttribute("order",order);
        List<Customer> customers = customerService.findAll();
        model.addAttribute("customers",customers);
        return "order_update";
    }


    /**
     * 添加和修改实现
     * @param order
     * @return
     */
    @PostMapping(value = {"/add","/update"})
    public String addOrUpdate(Order order){
        if(order.getId()==null){//添加
            orderService.add(order);
        }else{
            orderService.update(order);
        }
        return "redirect:/order/list";
    }


    /**
     * 高级查询
     * @param orderQuery
     * @param model
     * @return
     */
    @RequestMapping("/query")
    public String query(OrderQuery orderQuery, Model model){
        List<Order> orders = orderService.query(orderQuery);
        model.addAttribute("orderQuery",orderQuery);
        model.addAttribute("orders",orders);
        return "order_list";
    }


}
