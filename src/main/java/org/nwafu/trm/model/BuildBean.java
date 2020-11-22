package org.nwafu.trm.model;

import java.math.BigDecimal;

/**
 * 建筑信息
 */
public class BuildBean {
    private String buildId;
    private String buildName;
    private String buildAddress;
    private String buildKind;
    private BigDecimal longitude = new BigDecimal(0);
    private BigDecimal latitude = new BigDecimal(0);
    private int buildClassroomNum;
    private String buildMessage;

    public String getBuildId() {
        return buildId;
    }

    public void setBuildId(String buildId) {
        this.buildId = buildId;
    }

    public String getBuildName() {
        return buildName;
    }

    public void setBuildName(String buildName) {
        this.buildName = buildName;
    }

    public String getBuildAddress() {
        return buildAddress;
    }

    public void setBuildAddress(String buildAddress) {
        this.buildAddress = buildAddress;
    }

    public String getBuildKind() {
        return buildKind;
    }

    public void setBuildKind(String buildKind) {
        this.buildKind = buildKind;
    }

    public BigDecimal getLongitude() {
        return longitude;
    }

    public void setLongitude(BigDecimal longitude) {
        this.longitude = longitude;
    }

    public BigDecimal getLatitude() {
        return latitude;
    }

    public void setLatitude(BigDecimal latitude) {
        this.latitude = latitude;
    }

    public int getBuildClassroomNum() {
        return buildClassroomNum;
    }

    public void setBuildClassroomNum(int buildClassroomNum) {
        this.buildClassroomNum = buildClassroomNum;
    }

    public String getBuildMessage() {
        return buildMessage;
    }

    public void setBuildMessage(String buildMessage) {
        this.buildMessage = buildMessage;
    }
}
