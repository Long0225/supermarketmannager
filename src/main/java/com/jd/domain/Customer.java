package com.jd.domain;

import lombok.Data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
/**
 * @author Long
 */
@Data
public class Customer {
    private Long id;
    private String name;
    private String phone;
    private String address;
    private Date create_time = new Date();
    private Date update_time = new Date();

}
