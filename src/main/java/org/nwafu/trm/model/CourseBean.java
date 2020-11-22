package org.nwafu.trm.model;

import java.math.BigDecimal;

/**
 * 课程
 */
public class CourseBean {

    private String courseId;        // 编号
    private String courseName;      // 名称
    private String courseTeacher;   // 任课老师
    private String courseCollege;   // 开课学院
    private String courseKind;     // 课程种类（必修、选修）
    private BigDecimal courseCredits = new BigDecimal(0);   // 学分
    private String courseAddress;  // 课程地址
    private String courseBook;      // 课程图书
    private String courseInfo;      // 课程信息

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseTeacher() {
        return courseTeacher;
    }

    public void setCourseTeacher(String courseTeacher) {
        this.courseTeacher = courseTeacher;
    }

    public String getCourseCollege() {
        return courseCollege;
    }

    public void setCourseCollege(String courseCollege) {
        this.courseCollege = courseCollege;
    }

    public String getCourseKind() {
        return courseKind;
    }

    public void setCourseKind(String courseKind) {
        this.courseKind = courseKind;
    }

    public BigDecimal getCourseCredits() {
        return courseCredits;
    }

    public void setCourseCredits(BigDecimal courseCredits) {
        this.courseCredits = courseCredits;
    }

    public String getCourseAddress() {
        return courseAddress;
    }

    public void setCourseAddress(String courseAddress) {
        this.courseAddress = courseAddress;
    }

    public String getCourseBook() {
        return courseBook;
    }

    public void setCourseBook(String courseBook) {
        this.courseBook = courseBook;
    }

    public String getCourseInfo() {
        return courseInfo;
    }

    public void setCourseInfo(String courseInfo) {
        this.courseInfo = courseInfo;
    }
}
