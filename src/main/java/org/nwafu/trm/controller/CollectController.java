package org.nwafu.trm.controller;

import org.nwafu.trm.model.BuildBean;
import org.nwafu.trm.service.CollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 用户收藏的信息
 */
@Controller
public class CollectController {
    @Autowired
    private CollectionService collectionService;

//    @RequestMapping(value = "findCollect")
//    @ResponseBody
//    private List<BuildBean> findCollect(String searchInfo, String searchBuildType) {
//        return null;
//    }

}
