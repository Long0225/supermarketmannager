package com.jd.mapper;

import com.jd.domain.Admin;
import com.jd.domain.Customer;

public interface AdminMapper {
    Admin findByUsername(String username);

    void update(Admin admin);
}
