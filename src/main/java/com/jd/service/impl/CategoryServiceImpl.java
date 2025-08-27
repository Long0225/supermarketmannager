package com.jd.service.impl;

import com.jd.domain.Category;
import com.jd.mapper.CategoryMapper;
import com.jd.mapper.ProductMapper;
import com.jd.query.CategoryQuery;
import com.jd.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
/**
 * @author Long
 */
@Service
public class CategoryServiceImpl implements ICategoryService {
    @Autowired
    private CategoryMapper categoryMapper;
    @Autowired
    private ProductMapper productMapper;
    @Override
    public List<Category> findAll() {
        return categoryMapper.findAll();
    }

    @Override
    public Category findOne(Long id) {
        return categoryMapper.findOne(id);
    }

    @Override
    public void add(Category category) {
        categoryMapper.add(category);
    }

    @Override
    public void update(Category category) {
        categoryMapper.update(category);
    }

    @Override

    public void delete(Long id) {
        productMapper.delByCategoryId(id);
        categoryMapper.delete(id);
    }

    @Override
    public List<Category> query(CategoryQuery categoryQuery) {
        return categoryMapper.query(categoryQuery);
    }
}
