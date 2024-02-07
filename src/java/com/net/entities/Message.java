package com.net.entities;

public class Message {

    private String content;
    private String type;
    private String setclass;

    public Message(String content, String type, String setclass) {
        this.content = content;
        this.type = type;
        this.setclass = setclass;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSetclass() {
        return setclass;
    }

    public void setSetclass(String setclass) {
        this.setclass = setclass;
    }

}
