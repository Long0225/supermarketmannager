package com.jd.domain;

import lombok.Data;

@Data
public class Admin {
    private Long id;
    private String username;
    private String password;
    private String nickname;
    private String note;
}
