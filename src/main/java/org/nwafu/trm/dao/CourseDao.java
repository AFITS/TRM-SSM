package org.nwafu.trm.dao;

import org.apache.ibatis.annotations.Param;
import org.nwafu.trm.model.CourseBean;

import java.util.List;

public interface CourseDao {

    // 搜索所有课程信息
    public List<CourseBean> findAllCourseMessage(@Param(value = "searchName") String searchName);

    // 查找：学院搜索
    public List<CourseBean> findCourseByCollege(@Param(value = "searchName") String searchName);

    // 查找：老师搜索
    public List<CourseBean> findCourseByTeacherName(@Param(value = "searchName") String searchName);

    // 查找：地址搜索
    public List<CourseBean> findCourseByAddress(@Param(value = "searchName") String searchName);

    // 根据Id删除课程信息
    public void deleteCourseMessage(@Param(value = "courseId") String courseId);

    // 新增课程信息
    public void insertCourseMessage(CourseBean CourseBean);

    // 修改课程信息
    public void updateCourseMessage(CourseBean CourseBean);
}
