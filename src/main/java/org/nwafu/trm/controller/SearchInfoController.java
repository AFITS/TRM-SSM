package org.nwafu.trm.controller;

import org.nwafu.trm.model.BaseBean;
import org.nwafu.trm.service.SearchInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 搜索信息的控制类
 */
@Controller
public class SearchInfoController {
    @Autowired
    private SearchInfoService searchInfoService;


    /**
     * 1.查询搜索统计信息
     */
    @RequestMapping(value = "/findCheckInfo")
    @ResponseBody
    public BaseBean getClassroomInfo(String searchName) {

        return searchInfoService.findSearchInfo(searchName);
    }
}
