/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.net.entities;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
public class Comment {
    private int cId;
    private String cContent;
    private int cPostId;
    private int cUserId;
    private Timestamp cDate;

    public Comment(int cId, String cContent, int cPostId, int cUserId, Timestamp cDate) {
        this.cId = cId;
        this.cContent = cContent;
        this.cPostId = cPostId;
        this.cUserId = cUserId;
        this.cDate = cDate;
    }
//
//    public Comment(int cId, String cContent, int cPostId, int cUserId, Timestamp cDate) {
//        this.cId = cId;
//        this.cContent = cContent;
//        this.cPostId = cPostId;
//        this.cUserId = cUserId;
//        this.cDate = cDate;
//    }
    
    public Comment( String cContent, int cPostId, int cUserId, Timestamp cDate) {
        this.cContent = cContent;
        this.cPostId = cPostId;
        this.cUserId = cUserId;
        this.cDate = cDate;
    }
    
    public Comment( String cContent, int cPostId, int cUserId) {
        this.cContent = cContent;
        this.cPostId = cPostId;
        this.cUserId = cUserId;
    }
    
    public String getFormattedDate() {
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MMMM-yyyy HH:mm");
        return formatter.format(this.getcDate());
    }
    
    public Comment(int cId, String cContent, int cPostId, int cUserId) {
        this.cId = cId;
        this.cContent = cContent;
        this.cPostId = cPostId;
        this.cUserId = cUserId;
    }
    
    public Comment() {
    }
    
    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcContent() {
        return cContent;
    }

    public void setcContent(String cContent) {
        this.cContent = cContent;
    }

    public int getcPostId() {
        return cPostId;
    }

    public void setcPostId(int cPostId) {
        this.cPostId = cPostId;
    }

    public int getcUserId() {
        return cUserId;
    }

    public void setcUserId(int cUserId) {
        this.cUserId = cUserId;
    }

    public Timestamp getcDate() {
        return cDate;
    }

    public void setcDate(Timestamp cDate) {
        this.cDate = cDate;
    }

    
}
