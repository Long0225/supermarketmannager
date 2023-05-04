package com.jd.controller;

import com.jd.constant.SystemConstant;
import com.jd.domain.Customer;
import com.jd.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    private ICustomerService customerService;
    @RequestMapping("/list")
    public String list(Model model) {
        List<Customer> customers = customerService.findAll();
        model.addAttribute("customers", customers);
        return "customer_list";
    }
    @RequestMapping("/del")
    public String delete(Long id) {
        customerService.delete(id);
        return "redirect:/customer/list";
    }
    @RequestMapping("/view")
    public String view(Model model,Long id) {
        Customer customer = customerService.findOne(id);
        model.addAttribute("customer", customer);
        return "customer_view";
    }
    @RequestMapping("/add")
    public String add() {
        return "customer_add";
    }
    @RequestMapping("/update")
    public String update(Long id,Model model) {
        Customer customer = customerService.findOne(id);
        model.addAttribute("customer", customer);
        return "customer_update";
    }
    @PostMapping(value ={"/add","/update"})
    public String addOrUpdate(Customer customer) {
        if (customer.getId() == null) {//添加
            customerService.add(customer);
        }else{
            customerService.update(customer);
        }
        return "redirect:/customer/list";
    }

}
