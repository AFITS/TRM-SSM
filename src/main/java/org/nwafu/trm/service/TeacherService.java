package org.nwafu.trm.service;

import org.nwafu.trm.dao.LaboratoryDao;
import org.nwafu.trm.dao.TeacherDao;
import org.nwafu.trm.model.BaseBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeacherService {
    @Autowired
    private TeacherDao teacherDao;
    /**
     * 获取老师信息
     */
    public BaseBean findTeacherInfo(String teacherName) {
        return transToBaseBean(0, "success", teacherDao.getTeacherByName(teacherName));
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
