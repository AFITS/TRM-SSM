package org.nwafu.trm.controller;

import org.nwafu.trm.model.BaseBean;
import org.nwafu.trm.service.LaboratoryService;
import org.nwafu.trm.service.PlaygroundService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PlaygroundController {

    @Autowired
    private PlaygroundService playgroundService;

    @RequestMapping(value = "/findPlaygroundInfo")
    @ResponseBody
    public BaseBean get(String plaName) {
        return playgroundService.getPlaygroundInfo(plaName);
    }

}