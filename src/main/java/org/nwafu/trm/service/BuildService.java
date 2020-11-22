package org.nwafu.trm.service;

import org.nwafu.trm.dao.BuildDao;
import org.nwafu.trm.model.BuildBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BuildService {
    @Autowired
    private BuildDao buildDao;

    /**
     * 搜索建筑信息
     *
     * @deprecated 方式：所有、类型、名称
     */
    public List<BuildBean> findBuildMessage(String searchName, String searchBuildType) {
        switch (searchBuildType) {
            case "searchAll":
                return buildDao.findAllBuildMessage(searchName);
            case "searchByBuildKind":
                return buildDao.findBuildMessageByKind(searchName);
            case "searchByBuildName":
                return buildDao.findBuildMessageByName(searchName);
        }
        return null;
    }

    /**
     * 删除建筑信息根据ID
     *
     * @param buildId 建筑信息ID
     * @return
     */
    public boolean deleteBuildById(String buildId) {
        buildDao.deleteBuildMessage(buildId);
        return true;
    }

    /**
     * 新增建筑信息
     *
     * @param buildBean 建筑信息实体
     * @return
     */
    public boolean insertBuildMessage(BuildBean buildBean) {
        buildDao.insertBuildMessage(buildBean);
        return true;
    }

    /**
     * 修改建筑信息
     *
     * @param buildBean 建筑信息实体
     * @return
     */
    public boolean updateBuildMessage(BuildBean buildBean) {
        buildDao.updateBuildMessage(buildBean);
        return true;
    }

}
