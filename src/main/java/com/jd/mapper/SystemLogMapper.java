package com.jd.mapper;


import com.jd.domain.SystemLog;

import java.util.List;

public interface SystemLogMapper {
    List<SystemLog> findAll();
    SystemLog findOne(Long id);
    void add(SystemLog systemLog);
    void update(SystemLog systemLog);
    void delete(Long id);
}
