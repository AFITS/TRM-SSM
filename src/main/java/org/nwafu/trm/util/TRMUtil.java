package org.nwafu.trm.util;

import org.nwafu.trm.model.BaseBean;

public class TRMUtil {

    public BaseBean transToBaseBean(int code, String msg, Object object) {
        BaseBean baseBean = new BaseBean();
        baseBean.setCode(code);
        baseBean.setMsg(msg);
        baseBean.setData(object);
        return baseBean;
    }
}
