package org.nwafu.trm.service;

import org.nwafu.trm.dao.SearchInfoDao;
import org.nwafu.trm.model.BaseBean;
import org.nwafu.trm.model.ClassBean;
import org.nwafu.trm.model.SearchBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class SearchInfoService {
    @Autowired
    private SearchInfoDao searchInfoDao;


    /**
     * 获取搜索信息
     * @param searchName
     * @return
     */
    public BaseBean findSearchInfo(String searchName) {
        System.out.println(searchName);
        ArrayList<SearchBean> result = searchInfoDao.findSearchInfo(searchName);
        return transToBaseBean(0, "success", result);
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
