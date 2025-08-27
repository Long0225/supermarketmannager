package com.jd.service;

import com.jd.domain.Category;
import com.jd.query.CategoryQuery;

import java.util.List;

public interface ICategoryService {
    List<Category> findAll();
    Category findOne(Long id);
    void add(Category category);
    void update(Category category);
    void delete(Long id);
    List<Category> query(CategoryQuery categoryQuery);
}
