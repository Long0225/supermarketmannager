package com.jd.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SystemLog {
    private Long id;
    private Long operation_id;
    private String content;
    private Date create_time;
    private Admin admin;

}
