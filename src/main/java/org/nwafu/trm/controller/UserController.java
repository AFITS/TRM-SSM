package org.nwafu.trm.controller;

import org.nwafu.trm.model.BaseBean;
import org.nwafu.trm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 用户登录
     */
    @RequestMapping(value = "/userLogin")
    @ResponseBody
    public BaseBean loginCheck(String userName, String userPwd) {
        return userService.userLogin(userName, userPwd);
    }

    /**
     * 用户通过手机号登陆
     */
    @RequestMapping(value = "/userLoginByPhone")
    @ResponseBody
    public BaseBean userLoginByPhone(String userPhone) {
        return userService.userLoginByPhone(userPhone);
    }

    /**
     * 用户注册
     */
    @RequestMapping(value = "/userRegister")
    @ResponseBody
    public BaseBean register(String userName, String userNum, String userPwd) {
        return userService.userRegister(userName, userNum, userPwd);
    }


}
