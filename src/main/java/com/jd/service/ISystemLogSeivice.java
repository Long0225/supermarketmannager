package com.jd.service;

import com.jd.domain.SystemLog;

import java.util.List;

public interface ISystemLogSeivice {
    List<SystemLog> findAll();
    SystemLog findOne(Long id);
    void add(SystemLog systemLog);
    void update(SystemLog systemLog);
    void delete(Long id);
}
