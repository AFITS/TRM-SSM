package org.nwafu.trm.dao;

import org.apache.ibatis.annotations.Param;
import org.nwafu.trm.model.ClassroomBean;

public interface ClassroomDao {

    // 通过用户名获得用户实体
    public ClassroomBean getClassroomById(@Param(value = "classroomId") String classroomId);

    // 判断教室信息存在
    public Integer checkClassroomIdExist(@Param(value = "classroomId") String classroomId);


}
