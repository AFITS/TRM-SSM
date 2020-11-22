package org.nwafu.trm.dao;

import org.apache.ibatis.annotations.Param;
import org.nwafu.trm.model.AdminBean;
import org.nwafu.trm.model.ClassBean;

import java.util.ArrayList;

public interface AdminDao {
    public void addAdmin(@Param(value = "adminBean") AdminBean adminBean);
}
