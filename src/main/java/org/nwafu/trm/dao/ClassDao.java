package org.nwafu.trm.dao;

import org.apache.ibatis.annotations.Param;
import org.nwafu.trm.model.ClassBean;
import org.nwafu.trm.model.ClassBean;

import java.util.ArrayList;
import java.util.List;

public interface ClassDao {
    // 查询空闲教室
    public ArrayList<ClassBean> findFreeClass(@Param(value = "address") String address,
                                              @Param(value = "date") String date,
                                              @Param(value = "time") String time);

    // 查询教室的课程信息
    public ArrayList<ClassBean> getClassroomClass(@Param(value = "classroomId") String classroomId,
                                                  @Param(value = "date") String date);


    // 搜索所有课程信息
    public List<ClassBean> findAllClassMessage(@Param(value = "searchName") String searchName);

    // 日期搜索
    public List<ClassBean> findClassByClassDate(@Param(value = "searchName") String searchName);

    // 时间搜索
    public List<ClassBean> findClassByClassTime(@Param(value = "searchName") String searchName);

    // 教室Id
    public List<ClassBean> findClassByClassroomId(@Param(value = "searchName") String searchName);

    // 根据Id删除建筑信息
    public void deleteClassMessage(@Param(value = "classId") String classId);

    // 新增建筑信息
    public void insertClassMessage(ClassBean classBean);

    // 修改建筑信息
    public void updateClassMessage(ClassBean classBean);
}
