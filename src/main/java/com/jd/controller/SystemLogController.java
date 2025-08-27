package com.jd.controller;

import com.jd.domain.SystemLog;
import com.jd.service.ISystemLogSeivice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;
/**
 * @author Long
 */
@Controller
@RequestMapping("/log")
public class SystemLogController {
    @Autowired
    private ISystemLogSeivice systemLogSeivice;
    @RequestMapping("/list")
    public String list(Model model) {
        List<SystemLog> systemLogs = systemLogSeivice.findAll();
        model.addAttribute("systemLogs", systemLogs);
        return "systemLog_list";
    }
    @RequestMapping("/view")
    public String view(Model model,Long id) {
        SystemLog systemLog = systemLogSeivice.findOne(id);
        model.addAttribute("systemLog", systemLog);
        return "systemLog_view";
    }
    @RequestMapping("/del")
    public String delete(Long id) {
        systemLogSeivice.delete(id);
        return "redirect:/log/list";
    }
}
