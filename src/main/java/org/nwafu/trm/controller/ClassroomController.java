package org.nwafu.trm.controller;

import org.nwafu.trm.model.BaseBean;
import org.nwafu.trm.service.ClassroomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ClassroomController {

    @Autowired
    private ClassroomService classroomService;

    /**
     * 用户登录
     */
    @RequestMapping(value = "/findClassroomInfo")
    @ResponseBody
    public BaseBean getClassroomInfo(String classroomId) {
        return classroomService.getClassroomById(classroomId);
    }
}
