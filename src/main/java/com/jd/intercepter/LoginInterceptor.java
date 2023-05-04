package com.jd.intercepter;

import com.jd.constant.SystemConstant;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@Component
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //有就获取，没有就创建，每一个登录都有唯一对象
        HttpSession session = request.getSession();
        Object obj = session.getAttribute(SystemConstant.ADMIN_IN_SESSION);
        if (obj == null) {//要么没有登录要么登录超过了30分钟
            //跳转到登录页面
            response.sendRedirect("/login");
            return false;
        }
        //放行=将请求交给controller执行
        return true;

    }
}
