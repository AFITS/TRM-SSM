package org.nwafu.trm.controller;

import org.nwafu.trm.model.BaseBean;
import org.nwafu.trm.service.LaboratoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LaboratoryController {

    @Autowired
    private LaboratoryService laboratoryService;

    @RequestMapping(value = "/findLaboratoryInfo")
    @ResponseBody
    public BaseBean get(String labName) {
        return laboratoryService.getLaboratoryInfo(labName);
    }



}
