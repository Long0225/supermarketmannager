package com.jd.controller;

import com.jd.domain.Category;
import com.jd.domain.Customer;
import com.jd.domain.Order;
import com.jd.query.CategoryQuery;
import com.jd.query.OrderQuery;
import com.jd.service.ICategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("category")
public class CategoryController {
    @Autowired
    private ICategoryService categoryService;

    /**
     * 列表数据
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String list(Model model){
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        return "category_list";  // /templates/   order_list   .html
    }


    /**
     * 删除功能
     * @param
     * @return
     */
    @RequestMapping("/del")
    public String del(Long id){
        categoryService.delete(id);
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
        Category category = categoryService.findOne(id);
        model.addAttribute("category",category);
        return "category_view";
    }

    /**
     * 跳转到添加页面
     * @return
     */
    @RequestMapping("/toAdd")
    public String toAdd(Model model){


        return "category_add";
    }

    /**
     * 跳转到修改页面 - 做数据回显
     * @return
     */
    @RequestMapping ("/toUpdate")
    public String toUpdate(Long id,Model model){
        Category category = categoryService.findOne(id);
        model.addAttribute("category",category);

        return "category_update";
    }


    /**
     * 添加和修改实现
     * @param category
     * @return
     */
    @PostMapping(value = {"/add","/update"})
    public String addOrUpdate(Category category){
        if(category.getId()==null){//添加
            categoryService.add(category);
        }else{
            categoryService.update(category);
        }
        return "redirect:list";
    }


    /**
     * 高级查询
     * @param categoryQuery
     * @param model
     * @return
     */
    @RequestMapping("/query")
    public String query(CategoryQuery categoryQuery, Model model){
        List<Category> categories = categoryService.query(categoryQuery);
        model.addAttribute("categoryQuery",categoryQuery);
        model.addAttribute("categories",categories);
        return "category_list";
    }
}
