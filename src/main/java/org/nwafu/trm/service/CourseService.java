package org.nwafu.trm.service;

import org.nwafu.trm.dao.CourseDao;
import org.nwafu.trm.model.BaseBean;
import org.nwafu.trm.model.CourseBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseService {
    @Autowired
    private CourseDao courseDao;

    /**
     * 搜索课程信息
     *
     * @deprecated 方式：所有、老师名称、学院、地址
     */
    public List<CourseBean> findCourseMessage(String searchName, String searchClassType) {
        switch (searchClassType) {
            case "searchAll":
                return courseDao.findAllCourseMessage(searchName);
            case "searchByTeacherName":
                return courseDao.findCourseByTeacherName(searchName);
            case "searchByCollege":
                return courseDao.findCourseByCollege(searchName);
            case "searchByAddress":
                return courseDao.findCourseByAddress(searchName);
        }
        return null;
    }


    /**
     * 删除课程信息根据ID
     *
     * @param courseId 课程信息ID
     * @return
     */
    public boolean deleteCourseById(String courseId) {
        courseDao.deleteCourseMessage(courseId);
        return true;
    }

    /**
     * 新增课程信息
     *
     * @param courseBean 课程信息实体
     * @return
     */
    public boolean insertCourseMessage(CourseBean courseBean) {
        courseDao.insertCourseMessage(courseBean);
        return true;
    }

    /**
     * 修改课程信息
     *
     * @param courseBean 课程信息实体
     * @return
     */
    public boolean updateCourseMessage(CourseBean courseBean) {
        courseDao.updateCourseMessage(courseBean);
        return true;
    }

    // 转化结果为BaseBean
    public BaseBean transToBaseBean(int code, String msg, Object object) {
        BaseBean baseBean = new BaseBean();
        baseBean.setCode(code);
        baseBean.setMsg(msg);
        baseBean.setData(object);
        return baseBean;
    }
}
