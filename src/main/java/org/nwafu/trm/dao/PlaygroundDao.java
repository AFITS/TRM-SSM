package org.nwafu.trm.dao;

import org.apache.ibatis.annotations.Param;
import org.nwafu.trm.model.LaboratoryBean;
import org.nwafu.trm.model.PlaygroundBean;

public interface PlaygroundDao {
    // 通过运动场名称获得运动场实体
    public PlaygroundBean getPlaygroundByName(@Param(value = "playgroundName") String playgroundName);
}
