package org.nwafu.trm.dao;

import org.apache.ibatis.annotations.Param;
import org.nwafu.trm.model.BuildBean;

import java.util.List;

public interface BuildDao {
    // 搜索所有建筑信息
    public List<BuildBean> findAllBuildMessage(@Param(value = "searchName") String searchName);

    // 名字搜索
    public List<BuildBean> findBuildMessageByName(@Param(value = "searchName") String searchName);

    // 类型搜索
    public List<BuildBean> findBuildMessageByKind(@Param(value = "searchName") String searchName);

    // 根据Id删除建筑信息
    public void deleteBuildMessage(@Param(value = "buildId") String buildId);

    // 新增建筑信息
    public void insertBuildMessage(BuildBean buildBean);

    // 修改建筑信息
    public void updateBuildMessage(BuildBean buildBean);
}
