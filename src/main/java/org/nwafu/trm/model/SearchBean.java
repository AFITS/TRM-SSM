package org.nwafu.trm.model;

/**
 * 搜索统计类
 */
public class SearchBean {
    private String searchId;
    private String searchName;
    private String searchKind;
    private int searchNum;
    private String searchDate;
    private String searchBelong;

    public String getSearchId() {
        return searchId;
    }

    public void setSearchId(String searchId) {
        this.searchId = searchId;
    }

    public String getSearchName() {
        return searchName;
    }

    public void setSearchName(String searchName) {
        this.searchName = searchName;
    }

    public String getSearchKind() {
        return searchKind;
    }

    public void setSearchKind(String searchKind) {
        this.searchKind = searchKind;
    }

    public int getSearchNum() {
        return searchNum;
    }

    public void setSearchNum(int searchNum) {
        this.searchNum = searchNum;
    }

    public String getSearchDate() {
        return searchDate;
    }

    public void setSearchDate(String searchDate) {
        this.searchDate = searchDate;
    }

    public String getSearchBelong() {
        return searchBelong;
    }

    public void setSearchBelong(String searchBelong) {
        this.searchBelong = searchBelong;
    }
}
