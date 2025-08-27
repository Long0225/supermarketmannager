package com.jd.query;

import lombok.Data;

//接收查询的数据
@Data
public class OrderQuery {

    private String order_sn;
    private Long customer_id;
    private Integer state;
}
