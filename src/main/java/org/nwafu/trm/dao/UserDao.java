package org.nwafu.trm.dao;


import org.nwafu.trm.model.UserBean;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    // 检查用户和登录密码
    public int checkLoginNameAndPwd(@Param(value = "userName") String userName, @Param(value = "userPwd") String userPwd);

    // 检查用户名存在
    public int checkUserNameExist(@Param(value = "userName") String userName);

    // 检查手机号存在
    public int checkPhoneRight(@Param(value = "userPhone") String userPhone);

    // 通过用户名获得用户实体
    public UserBean getUserByName(@Param(value = "userName") String userName);

    // 通过手机号获得用户实体
    public UserBean getUserByPhone(@Param(value = "userPhone") String userPhone);

    // 新增用户
    public void addUser(UserBean user);

    public UserBean findByName(String username) throws Exception;

    public int findByEmail(String email) throws Exception;

    public int findByUser(String user) throws Exception;

}
