
package com.net.entities;
import java.sql.Timestamp;

public class User {
    private int id;
    private String basicname;
    private String number;
    private String username;
    private String email;
    private String password;
    private String gender;
    private Timestamp udate;
    private String profile;
    private String profession;
    private String bio;

    public User() {
        
    }

    public User(int id, String basicname, String number, String username, String email, String password, String gender, Timestamp udate, String profile) {
        this.id = id;
        this.basicname = basicname;
        this.number = number;
        this.username = username;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.udate = udate;
        this.profile = profile;
    }

    public User(String basicname, String number, String username, String email, String password, String gender, String profile) {
        this.basicname = basicname;
        this.number = number;
        this.username = username;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.profile = profile;
    }

    public User(String basicname, String number, String username, String email, String password, String gender) {
        this.basicname = basicname;
        this.number = number;
        this.username = username;
        this.email = email;
        this.password = password;
        this.gender = gender;
    }
    
    public User(String number, String username, String gender, String password, String profile, String bio, String profession,String email) {
        this.number = number;
        this.username = username;
        this.gender = gender;
        this.password = password;
        this.profile = profile;
        this.bio = bio;
        this.profession = profession;        
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String Profession) {
        this.profession = Profession;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String Bio) {
        this.bio = Bio;
    }
    
        
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBasicname() {
        return basicname;
    }

    public void setBasicname(String basicname) {
        this.basicname = basicname;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getUdate() {
        return udate;
    }

    public void setUdate(Timestamp udate) {
        this.udate = udate;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
        
}
