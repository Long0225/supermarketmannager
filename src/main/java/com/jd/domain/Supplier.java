package com.jd.domain;

import lombok.Data;

import java.util.Date;
/**
 * @author Long
 */
@Data
public class Supplier {
    private Long id;
    private String code;
    private String name;
    private String contact;
    private String phone;
    private String address;
    private Date create_time = new Date();
}
