package org.nwafu.trm.service;

import org.nwafu.trm.dao.LaboratoryDao;
import org.nwafu.trm.model.BaseBean;
import org.nwafu.trm.model.ClassBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class LaboratoryService {
    @Autowired
    private LaboratoryDao laboratoryDao;
    /**
     * 获取实验室信息
     */
    public BaseBean getLaboratoryInfo(String labName) {
        return transToBaseBean(0, "success", laboratoryDao.getLaboratoryByName(labName));
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
