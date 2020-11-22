package org.nwafu.trm.controller;

import org.nwafu.trm.model.BaseBean;
import org.nwafu.trm.model.ClassBean;
import org.nwafu.trm.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ClassController {
    @Autowired
    private ClassService classService;

    /**
     * 1.查询空闲教室
     */
    @RequestMapping(value = "/findFreeClass")
    @ResponseBody
    public BaseBean getClassroomInfo(String address, String freeDate, String timeLong) {
        return classService.findFreeClass(address, freeDate, timeLong);
    }

    /**
     * 2.查询教室的课程信息
     */
    @RequestMapping(value = "/findClassroomClass")
    @ResponseBody
    public BaseBean getClassroomClass(String classroomId, String date) {
        return classService.getClassroomClass(classroomId, date);
    }

    /**
     * 根据条件显示课程信息
     */
    @RequestMapping(value = "/findClass")
    @ResponseBody
    public List<ClassBean> findClassMessage(String searchInfo, String searchClassType) {
        return classService.findClassMessage(searchInfo, searchClassType);
    }

    /**
     * 通过名称删除课时信息
     *
     * @param classId 课时Id
     * @return
     */
    @RequestMapping(value = "deleteClass")
    @ResponseBody
    private String deleteBuildMessageById(String classId) {
        classService.deleteClassById(classId);
        return "success";
    }

    /**
     * 插入课时信息
     *
     * @param classBean 课时信息实体
     * @return
     */
    @RequestMapping(value = "insertClass")
    @ResponseBody
    private String insertBuildMessage(ClassBean classBean) {
        classService.insertClassMessage(classBean);
        return "success";
    }

    /**
     * 更新课时实体信息
     *
     * @param classBean
     * @return
     */
    @RequestMapping(value = "updateClass")
    @ResponseBody
    private String updateBuildMessage(ClassBean classBean) {
        classService.updateClassMessage(classBean);
        return "success";
    }
}
