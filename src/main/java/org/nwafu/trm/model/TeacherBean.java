package org.nwafu.trm.model;

import java.sql.Blob;

/**
 * 教师类
 */
public class TeacherBean {
    public String teacherId;
    public String teacherName;
    public Blob teacherImage;
    public String teacherCollege;
    public String teacherMajor;
    public String teacherAddress;
    public String teacherOffice;
    public String teacherPhone;
    public String teacherEmail;
    public String teacherInfo;

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public Blob getTeacherImage() {
        return teacherImage;
    }

    public void setTeacherImage(Blob teacherImage) {
        this.teacherImage = teacherImage;
    }

    public String getTeacherCollege() {
        return teacherCollege;
    }

    public void setTeacherCollege(String teacherCollege) {
        this.teacherCollege = teacherCollege;
    }

    public String getTeacherMajor() {
        return teacherMajor;
    }

    public void setTeacherMajor(String teacherMajor) {
        this.teacherMajor = teacherMajor;
    }

    public String getTeacherAddress() {
        return teacherAddress;
    }

    public void setTeacherAddress(String teacherAddress) {
        this.teacherAddress = teacherAddress;
    }

    public String getTeacherOffice() {
        return teacherOffice;
    }

    public void setTeacherOffice(String teacherOffice) {
        this.teacherOffice = teacherOffice;
    }

    public String getTeacherPhone() {
        return teacherPhone;
    }

    public void setTeacherPhone(String teacherPhone) {
        this.teacherPhone = teacherPhone;
    }

    public String getTeacherEmail() {
        return teacherEmail;
    }

    public void setTeacherEmail(String teacherEmail) {
        this.teacherEmail = teacherEmail;
    }

    public String getTeacherInfo() {
        return teacherInfo;
    }

    public void setTeacherInfo(String teacherInfo) {
        this.teacherInfo = teacherInfo;
    }
}
