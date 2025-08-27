package com.jd.service.impl;

import com.jd.domain.SystemLog;
import com.jd.mapper.SystemLogMapper;
import com.jd.service.ISystemLogSeivice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * @author Long
 */
@Service
public class SystemLogSeiviceImpl implements ISystemLogSeivice {
    @Autowired
    private SystemLogMapper systemLogMapper;
    @Override
    public List<SystemLog> findAll() {

        return systemLogMapper.findAll();
    }

    @Override
    public SystemLog findOne(Long id) {

        return systemLogMapper.findOne(id);
    }

    @Override
    public void add(SystemLog systemLog) {

        systemLogMapper.add(systemLog);
    }

    @Override
    public void update(SystemLog systemLog) {
        systemLogMapper.update(systemLog);
    }

    @Override
    public void delete(Long id) {
        systemLogMapper.delete(id);
    }
}
