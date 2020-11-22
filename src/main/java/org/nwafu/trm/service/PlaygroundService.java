package org.nwafu.trm.service;

import org.nwafu.trm.dao.LaboratoryDao;
import org.nwafu.trm.dao.PlaygroundDao;
import org.nwafu.trm.model.BaseBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlaygroundService {
    @Autowired
    private PlaygroundDao playgroundDao;

    /**
     * 获取运动场信息
     */
    public BaseBean getPlaygroundInfo(String plaName) {
        return transToBaseBean(0, "success", playgroundDao.getPlaygroundByName(plaName));
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
