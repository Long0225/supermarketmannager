package com.jd.service;

import com.jd.domain.Admin;

public interface IAdminService {

    Admin login(Admin admin);
    Admin changePassword(String username, String oldPassword, String newPassword, String confirmPassword);
    Admin findByUsername(String username);
    void update(Admin dbadmin);
}
