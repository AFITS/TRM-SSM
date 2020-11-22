package org.nwafu.trm.dao;

import org.apache.ibatis.annotations.Param;
import org.nwafu.trm.model.TeacherBean;

public interface TeacherDao {
    // 通过老师名称获得老师实体
    public TeacherBean getTeacherByName(@Param(value = "teacherName") String teacherName);

}
