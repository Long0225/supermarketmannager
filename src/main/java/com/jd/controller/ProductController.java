package com.jd.controller;

import com.jd.domain.*;
import com.jd.query.OrderQuery;
import com.jd.query.ProductQuery;
import com.jd.service.ICategoryService;
import com.jd.service.IProductService;
import com.jd.service.ISupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
/**
 * @author Long
 */
//商品
@Controller
@RequestMapping("product")
public class ProductController {
    @Autowired
    private IProductService productService;
    @Autowired
    private ISupplierService supplierService;
    @Autowired
    private ICategoryService categoryService;

    /**
     * 列表数据
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String list(Model model,Long id){
        List<Product> products = productService.findAll();
        model.addAttribute("products",products);
        List<Supplier> suppliers = supplierService.findAll();
        model.addAttribute("suppliers",suppliers);
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        return "product_list";  // /templates/   order_list   .html
    }


    /**
     * 删除功能
     * @param
     * @return
     */
    @RequestMapping("/del")
    public String del(Long id){
        productService.delete(id);
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
        Product product = productService.findOne(id);
        model.addAttribute("product",product);
        return "product_view";
    }

    /**
     * 跳转到添加页面
     * @return
     */
    @RequestMapping("/toAdd")
    public String toAdd(Model model){

        List<Supplier> suppliers = supplierService.findAll();
        model.addAttribute("suppliers",suppliers);
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        return "product_add";
    }

    /**
     * 跳转到修改页面 - 做数据回显
     * @return
     */
    @RequestMapping ("/toUpdate")
    public String toUpdate(Model model,Long id){
        Product product = productService.findOne(id);
        model.addAttribute("product",product);
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        List<Supplier> suppliers = supplierService.findAll();
        model.addAttribute("suppliers",suppliers);

        return "product_update";
    }


    /**
     * 添加和修改实现
     * @param product
     * @return
     */
    @PostMapping(value = {"/add","/update"})
    public String addOrUpdate(Product product){
        if(product.getId()==null){//添加
            productService.add(product);
        }else{
            productService.update(product);
        }
        return "redirect:list";
    }


    /**
     * 高级查询
     * @param productQuery
     * @param model
     * @return
     */
    @RequestMapping("/query")
    public String query(ProductQuery productQuery, Model model){
        List<Product> products = productService.query(productQuery);
        model.addAttribute("productQuery",productQuery);
        model.addAttribute("products",products);

        List<Supplier> suppliers = supplierService.findAll();
        model.addAttribute("suppliers",suppliers);
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        return "product_list";
    }

}
