package org.nwafu.trm.dao;

import org.apache.ibatis.annotations.Param;
import org.nwafu.trm.model.SearchBean;

import java.util.ArrayList;

public interface SearchInfoDao {
    // 查询热度信息
    public ArrayList<SearchBean> findSearchInfo(@Param(value = "searchName") String searchName);
}
