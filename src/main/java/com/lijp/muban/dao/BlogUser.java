package com.lijp.muban.dao;

import java.io.Serializable;
import java.util.Date;

public class BlogUser implements Serializable{
	private static final long serialVersionUID = 6687286913317513141L;
	
    private Integer userId;

    private String userName;

    private String userPassword;

    private String userEmail;
    
    private byte[] userImage;

    private Date userRegisterTime;

    private Date userLastTime;

    private Date userCreatetime;

    private Date userUpdatetime;

    

	public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }
 
	
    public byte[] getUserImage() {
		return userImage;
	}

	public void setUserImage(byte[] userImage) {
		this.userImage = userImage;
	}

	public Date getUserRegisterTime() {
        return userRegisterTime;
    }

    public void setUserRegisterTime(Date userRegisterTime) {
        this.userRegisterTime = userRegisterTime;
    }

    public Date getUserLastTime() {
        return userLastTime;
    }

    public void setUserLastTime(Date userLastTime) {
        this.userLastTime = userLastTime;
    }

    public Date getUserCreatetime() {
        return userCreatetime;
    }

    public void setUserCreatetime(Date userCreatetime) {
        this.userCreatetime = userCreatetime;
    }

    public Date getUserUpdatetime() {
        return userUpdatetime;
    }

    public void setUserUpdatetime(Date userUpdatetime) {
        this.userUpdatetime = userUpdatetime;
    }

	@Override
	public String toString() {
		return "BlogUser [userId=" + userId + ", userName=" + userName + ", userPassword=" + userPassword
				+ ", userEmail=" + userEmail + ", userRegisterTime=" + userRegisterTime + ", userLastTime="
				+ userLastTime + ", userCreatetime=" + userCreatetime + ", userUpdatetime=" + userUpdatetime + "]";
	}
    
    
}