package org.nwafu.trm.dao;

import org.apache.ibatis.annotations.Param;
import org.nwafu.trm.model.ClassroomBean;
import org.nwafu.trm.model.LaboratoryBean;

public interface LaboratoryDao {
    // 通过实验室名称获得实验室实体
    public LaboratoryBean getLaboratoryByName(@Param(value = "labName") String labName);
}
