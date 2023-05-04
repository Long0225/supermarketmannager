package com.jd.controller;

import com.jd.constant.SystemConstant;
import com.jd.domain.Admin;
import com.jd.service.IAdminService;
import com.jd.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class SystemController {
    @Autowired
    private IAdminService adminService;
    @Autowired
    private ICustomerService customerService;

    //跳转到登录页面
    @GetMapping("/login")
    public String goLogin(){
        return "login";
    }
    @PostMapping("/login")
    public String login(Model model, HttpSession session,Admin admin){
        try { //将登录信息放在session中：1.做登录拦截 2.前端显示用户信息 3.改密码等
            Admin dbadmin = adminService.login(admin);
            session.setAttribute(SystemConstant.ADMIN_IN_SESSION, dbadmin);
            //登录成功跳转到后台首页
            return "index";
        }catch (Exception e){
            model.addAttribute("error", e.getMessage());
            return "login";
        }
    }
    @RequestMapping("/index")
    public String goIndex(Model model, HttpSession session){
        Admin admin = (Admin) session.getAttribute(SystemConstant.ADMIN_IN_SESSION);
        if (admin != null) {
            // 将用户名等信息通过Model传递到页面中
            model.addAttribute("admin", admin);
        }
        return "index";
    }
    @GetMapping("/logout")
    public String loginOut(HttpSession session){
        session.invalidate();
        return "login";
    }

    @GetMapping("/changePassword")
    public String changePassword(Model model, HttpSession session, String oldPassword, String newPassword, String confirmPassword) {

            // 获取当前登录的管理员
            Admin admin = (Admin) session.getAttribute(SystemConstant.ADMIN_IN_SESSION);
            if (admin == null) {
                // 未登录，跳转到登录页
                return "login";
            }

            if (!admin.getPassword().equals(oldPassword)) {
                // 旧密码不正确，提示错误信息
                model.addAttribute("msg", "旧密码不正确");
                return "password";
            }
            if (!newPassword.equals(confirmPassword)) {
                model.addAttribute("msg","新密码与确认密码不一致");
                return "password";

        }
        // 修改密码成功，清除Session中的管理员信息，需要重新登录
        session.removeAttribute(SystemConstant.ADMIN_IN_SESSION);
        return "login";

    }


}
