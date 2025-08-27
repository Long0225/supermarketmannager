package com.jd.query;

import com.jd.domain.Category;
import com.jd.domain.Supplier;
import lombok.Data;

@Data
public class ProductQuery {

    private String code;
    private Long category_id;
    private Long supplier_id;
}
