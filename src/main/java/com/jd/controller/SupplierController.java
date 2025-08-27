package com.jd.controller;

import com.jd.domain.Supplier;
import com.jd.service.ISupplierService;
import com.jd.service.impl.SupplierServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
/**
 * @author Long
 */
@Controller
@RequestMapping("/supplier")
public class SupplierController {
    @Autowired
    private ISupplierService supplierService;
    @RequestMapping("/list")
    public String list(Model model) {
        List<Supplier> suppliers = supplierService.findAll();
        model.addAttribute("suppliers",suppliers);
        return "supplier_list";
    }
    @RequestMapping("/del")
    public String delete(Long id) {
        supplierService.delete(id);
        return "redirect:/supplier/list";
    }
    @RequestMapping("/view")
    public String view(Model model,Long id) {
        Supplier supplier = supplierService.findOne(id);
        model.addAttribute("supplier", supplier);
        return "supplier_view";
    }
    @RequestMapping("/add")
    public String add() {
        return "supplier_add";
    }
    @RequestMapping("/update")
    public String update(Long id,Model model) {
        Supplier supplier = supplierService.findOne(id);
        model.addAttribute("supplier", supplier);
        return "supplier_update";
    }
    @PostMapping(value ={"/add","/update"})
    public String addOrUpdate(Supplier supplier) {
        if (supplier.getId() == null) {//添加
            supplierService.add(supplier);
        }else{
            supplierService.update(supplier);
        }
        return "redirect:/supplier/list";
    }
}
