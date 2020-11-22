package org.nwafu.trm.controller;

import org.nwafu.trm.model.BuildBean;
import org.nwafu.trm.service.BuildService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 建筑信息控制类
 */
@Controller
public class BuildController {
    @Autowired
    private BuildService buildService;

    /**
     * 通过搜索查找建筑，支持名称、类型、所有
     *
     * @param searchInfo 搜索的信息
     * @param searchBuildType 搜索类型
     * @return
     */
    @RequestMapping(value = "findBuildings")
    @ResponseBody
    private List<BuildBean> findBuildMessage(String searchInfo, String searchBuildType) {
        return buildService.findBuildMessage(searchInfo, searchBuildType);
    }


    /**
     * 通过名称删除建筑信息
     *
     * @param buildId 建筑Id
     * @return
     */
    @RequestMapping(value = "deleteBuild")
    @ResponseBody
    private String deleteBuildMessageById(String buildId) {
        buildService.deleteBuildById(buildId);
        return "success";
    }

    /**
     * 插入建筑信息
     *
     * @param buildBean 建筑信息实体
     * @return
     */
    @RequestMapping(value = "insertBuilding")
    @ResponseBody
    private String insertBuildMessage(BuildBean buildBean) {
        buildService.insertBuildMessage(buildBean);
        return "success";
    }

    /**
     * 更新建筑实体信息
     *
     * @param buildBean
     * @return
     */
    @RequestMapping(value = "updateBuilding")
    @ResponseBody
    private String updateBuildMessage(BuildBean buildBean) {
        buildService.updateBuildMessage(buildBean);
        return "success";
    }

}
