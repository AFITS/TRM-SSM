package org.nwafu.trm.service;

import org.nwafu.trm.dao.ClassroomDao;
import org.nwafu.trm.model.BaseBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClassroomService {

    @Autowired
    private ClassroomDao classroomDao;

    /**
     * 1.获得教室信息
     */
    public BaseBean getClassroomById(String classroomId) {
        if (checkClassroomIdExist(classroomId)) {
            return transToBaseBean(0, "success", classroomDao.getClassroomById(classroomId));
        }
        return transToBaseBean(-1, "fail", null);
    }

    // 检查教室Id存在
    public boolean checkClassroomIdExist(String classroomId) {
        int count = classroomDao.checkClassroomIdExist(classroomId);
        return count > 0;
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
