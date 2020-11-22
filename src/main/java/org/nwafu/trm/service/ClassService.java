package org.nwafu.trm.service;

import org.nwafu.trm.dao.ClassDao;
import org.nwafu.trm.model.BaseBean;
import org.nwafu.trm.model.ClassBean;
import org.nwafu.trm.model.ClassBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ClassService {
    @Autowired
    private ClassDao classDao;

    /**
     * 查找空闲教室
     */
    public BaseBean findFreeClass(String address, String date, String time) {
        System.out.println(address + " " + date + " " + time);
        ArrayList<ClassBean> result = classDao.findFreeClass(address, date, time);
        return transToBaseBean(0, "success", result);
    }

    /**
     * 查询教室的课程信息
     */
    public BaseBean getClassroomClass(String classroomId, String date) {
        ArrayList<ClassBean> result = classDao.getClassroomClass(classroomId, date);
        return transToBaseBean(0, "success", result);
    }



    /**
     * 搜索课时信息
     *
     * @deprecated 方式：所有、类型、名称
     */
    public List<ClassBean> findClassMessage(String searchName, String searchClassType) {
        switch (searchClassType) {
            case "searchAll":
                return classDao.findAllClassMessage(searchName);
            case "searchByClassDate":
                return classDao.findClassByClassDate(searchName);
            case "searchByClassTime":
                return classDao.findClassByClassTime(searchName);
        }
        return null;
    }


    /**
     * 删除课时信息根据ID
     *
     * @param ClassId 课时信息ID
     * @return
     */
    public boolean deleteClassById(String classId) {
        classDao.deleteClassMessage(classId);
        return true;
    }

    /**
     * 新增课时信息
     *
     * @param classBean 课时信息实体
     * @return
     */
    public boolean insertClassMessage(ClassBean classBean) {
        classDao.insertClassMessage(classBean);
        return true;
    }

    /**
     * 修改课时信息
     *
     * @param classBean 课时信息实体
     * @return
     */
    public boolean updateClassMessage(ClassBean classBean) {
        classDao.updateClassMessage(classBean);
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
