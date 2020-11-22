package org.nwafu.trm.service;


import org.nwafu.trm.dao.UserDao;
import org.nwafu.trm.model.BaseBean;
import org.nwafu.trm.model.UserBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserDao userDao;

    /**
     * 1.用户登录
     */
    public BaseBean userLogin(String userName, String userPwd) {
        if (checkNameAndPwdRight(userName, userPwd)) {
            return transToBaseBean(0, "success", getUserFromName(userName));
        }
        return transToBaseBean(-1, "fail", null);
    }

    /**
     * 2.用户通过手机号登陆
     */
    public BaseBean userLoginByPhone(String userPhone) {
        if (userDao.checkPhoneRight(userPhone) > 0) {
            return transToBaseBean(0, "success", userDao.getUserByPhone(userPhone));
        }
        return transToBaseBean(-1, "fail", null);
    }

    /**
     * 3.用户注册
     */
    public BaseBean userRegister(String userName, String userNum, String password) {
        if (checkUserNameExist(userName)) {
            addUser(userName, userNum, password);
            return transToBaseBean(0, "success", getUserFromName(userName));
        }
        return transToBaseBean(-1, "fail", null);
    }

    // 检查名字和密码正确
    public boolean checkNameAndPwdRight(String userName, String userPwd) {
        int count = userDao.checkLoginNameAndPwd(userName, userPwd);
        return count > 0;
    }

    // 检查用户名存在
    public boolean checkUserNameExist(String userName) {
        int count = userDao.checkUserNameExist(userName);
        return count == 0;
    }


    // 通过用户名获取用户
    public UserBean getUserFromName(String userName) {
        return userDao.getUserByName(userName);
    }

    // 增加用户
    public void addUser(String userName, String userNum, String userPwd) {
        UserBean userBean = new UserBean();
        userBean.setUserName(userName);
        userBean.setUserNum(userNum);
        userBean.setUserPwd(userPwd);
        userDao.addUser(userBean);
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
