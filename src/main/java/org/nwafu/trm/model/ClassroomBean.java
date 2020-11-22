package org.nwafu.trm.model;

/**
 * 教室类
 */
public class ClassroomBean {
    private String classroomId;     // 编号
    private String address;         // 地址
    private int maxNum;             // 容纳量
    private boolean projector;      // 投影仪
    private boolean blackboard;     // 黑板


    public String getClassroomId() {
        return classroomId;
    }

    public void setClassroomId(String classroomId) {
        this.classroomId = classroomId;
    }

    public boolean getProjector() {
        return projector;
    }

    public void setProjector(boolean projector) {
        this.projector = projector;
    }

    public boolean isBlackboard() {
        return blackboard;
    }

    public void setBlackboard(boolean blackboard) {
        this.blackboard = blackboard;
    }

    public int getMaxNum() {
        return maxNum;
    }

    public void setMaxNum(int maxNum) {
        this.maxNum = maxNum;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
