package com.jd.domain;

import lombok.Data;

@Data
public class Product {
   private Long id ;
   private String code;
   private String name ;
   private Double price;
   private Integer stock;
   private Long category_id;
   private Long supplier_id;
   private String desc;
   private Category category;
   private Supplier supplier;

}
