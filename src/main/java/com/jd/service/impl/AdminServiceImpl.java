package com.jd.service.impl;

import com.jd.exception.BusinessException;
import com.jd.domain.Admin;
import com.jd.mapper.AdminMapper;
import com.jd.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements IAdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public Admin login(Admin admin) {
        Admin dbadmin = adminMapper.findByUsername(admin.getUsername());
        if (dbadmin == null) {
            throw new BusinessException("用户名错误");
        }else{
            if (!dbadmin.getPassword().equals(admin.getPassword())) {
                throw new BusinessException("密码错误");
            }else{
                return dbadmin;
            }
        }

    }

    @Override
    public Admin changePassword(String username, String oldPassword, String newPassword, String confirmPassword) {
        // 先判断旧密码是否正确
        Admin admin = adminMapper.findByUsername(username);
        if (admin != null && admin.getPassword().equals(oldPassword)) {
            // 旧密码正确，判断新密码和确认密码是否一致
            if (newPassword.equals(confirmPassword)) {
                // 新密码和确认密码一致，更新用户密码
                admin.setPassword(newPassword);
                adminMapper.update(admin);
                return admin;
            } else {
                // 新密码和确认密码不一致，抛出异常或返回错误码
                throw new BusinessException("新密码和确认密码不一致");
            }
        } else {
            // 旧密码不正确，抛出异常或返回错误码
            throw new BusinessException("旧密码不正确");
        }
    }

    @Override
    public Admin findByUsername(String username) {
        return adminMapper.findByUsername(username);
    }

    @Override
    public void update(Admin admin) {
        adminMapper.update(admin);
    }



}
