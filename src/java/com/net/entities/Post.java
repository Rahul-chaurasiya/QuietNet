package com.net.entities;

import java.sql.Timestamp;

public class Post {

    private int pid;
    private String pTitle;
    private String pDescription;
    private String pPic;
    private Timestamp pDate;
    private int pUserid;

    public Post(int pid, String pTitle, String pDescription, String pPic, Timestamp pDate, int pUserid) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pDescription = pDescription;
        this.pPic = pPic;
        this.pDate = pDate;
        this.pUserid = pUserid;
    }
    
    public Post(String pTitle, String pDescription, String pPic, int pUserid) {
        this.pTitle = pTitle;
        this.pDescription = pDescription;
        this.pPic = pPic;
        this.pDate = pDate;
        this.pUserid = pUserid;
    }
    
    public Post(String pTitle, String pDescription, int pUserid) {
        this.pTitle = pTitle;
        this.pDescription = pDescription;
        this.pUserid = pUserid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpDescription() {
        return pDescription;
    }

    public void setpDescription(String pDescription) {
        this.pDescription = pDescription;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }


    public int getpUserid() {
        return pUserid;
    }

    public void setpUserid(int pUserid) {
        this.pUserid = pUserid;
    }

}
