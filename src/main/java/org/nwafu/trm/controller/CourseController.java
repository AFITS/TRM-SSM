package org.nwafu.trm.controller;

import org.nwafu.trm.model.ClassBean;
import org.nwafu.trm.model.CourseBean;
import org.nwafu.trm.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CourseController {
    @Autowired
    private CourseService courseService;

    /**
     * 根据条件显示课程信息
     */
    @RequestMapping(value = "/findCourse")
    @ResponseBody
    public List<CourseBean> findCourseMessage(String searchInfo, String searchCourseType) {
        return courseService.findCourseMessage(searchInfo, searchCourseType);
    }

    /**
     * 通过名称删除课程信息
     *
     * @param courseId 课程Id
     * @return
     */
    @RequestMapping(value = "deleteCourse")
    @ResponseBody
    private String deleteCourseMessageById(String courseId) {
        courseService.deleteCourseById(courseId);
        return "success";
    }

    /**
     * 插入课程信息
     *
     * @param courseBean 课程信息实体
     * @return
     */
    @RequestMapping(value = "insertCourse")
    @ResponseBody
    private String insertCourseMessage(CourseBean courseBean) {
        courseService.insertCourseMessage(courseBean);
        return "success";
    }

    /**
     * 更新课程实体信息
     *
     * @param courseBean 课程信息实体
     * @return
     */
    @RequestMapping(value = "updateCourse")
    @ResponseBody
    private String updateCourseMessage(CourseBean courseBean) {
        courseService.updateCourseMessage(courseBean);
        return "success";
    }


}
