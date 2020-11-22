package org.nwafu.trm.controller;

import org.nwafu.trm.model.AdminBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

    @RequestMapping("register")
    public ModelAndView register() {
        ModelAndView mv = new ModelAndView("register");
        return mv;
    }

    @RequestMapping("login")
    public ModelAndView login() {
        ModelAndView mv = new ModelAndView("login");
        return mv;
    }

    @RequestMapping("checkUser")
    @ResponseBody
    public String userRegister() {
        return "success";
    }

    @RequestMapping("personal")
    public ModelAndView adminLogin(AdminBean adminBean) {
        ModelAndView mv = new ModelAndView("mainPage");
        mv.addObject("admin",adminBean);
        return mv;
    }

}
