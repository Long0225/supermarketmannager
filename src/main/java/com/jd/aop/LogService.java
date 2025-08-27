package com.jd.aop;

import com.jd.constant.SystemConstant;
import com.jd.domain.Admin;
import com.jd.domain.SystemLog;

import com.jd.service.ISystemLogSeivice;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Slf4j
@Aspect
@Component
public class LogService {

    @Autowired
    private ISystemLogSeivice systemLogSeivice;

    /**
     * 定义切面表达式，明确要对哪些方法起作用
     */
    @Pointcut("execution(* com.jd.controller.*.*(..))")
    public void controllerPointcut() {}

    /**
     * 第三步：1.通过引用切点表达式，明确这个增强的应用规则。 2.编写增强逻辑
     */
    @Around(value = "controllerPointcut()")
    public Object doAround(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        SystemLog systemLog = new SystemLog();
        // 获取类名
        String className = proceedingJoinPoint.getTarget().getClass().getName();
        log.debug(className);
        // 获取方法名
        String methodName = proceedingJoinPoint.getSignature().getName();
        log.debug(methodName);
        if(!"login".equals(methodName)&&!"goLogin".equals(methodName)){//在登录
            //获取登录人id = operation_id

            //content   ip在访问className的methodName
            //create_time = domain【new】
            //SystemLogMapper.add(Log);
            // 获取IP地址
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            String ip = request.getRemoteAddr();
            log.debug(ip);

        // 获取登录用户的id
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute(SystemConstant.ADMIN_IN_SESSION);
            Long id = admin.getId();
            log.debug("id="+id);
            System.out.println(id);
            // 设置创建时间
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
        String time = format.format(date);
        String content = "["+request.getRemoteAddr()+"在"+time+"操作了"
                +className+"的"+methodName+"方法"+"]";
        //把获取到的数据封装到数据库
        systemLog.setCreate_time(new Date());
        systemLog.setOperation_id(id);
        systemLog.setContent(content);
        // 插入日志记录
         systemLogSeivice.add(systemLog);

        }
        Object result = proceedingJoinPoint.proceed();
        // 更新操作内容


        return result;
    }
}



