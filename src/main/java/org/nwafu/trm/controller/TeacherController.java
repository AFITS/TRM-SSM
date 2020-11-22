package org.nwafu.trm.controller;

import org.nwafu.trm.model.BaseBean;
import org.nwafu.trm.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TeacherController {
    @Autowired
    private TeacherService teacherService;

    @RequestMapping(value = "/findTeacherInfo")
    @ResponseBody
    public BaseBean get(String teacherName) {
        return teacherService.findTeacherInfo(teacherName);
    }

}
