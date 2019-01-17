package com.ncs.green.vo;

public class UserVO {
	
	private String id ;
	private String password ;
	private String loginTime ;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", loginTime=" + loginTime + "]";
	}
} // class
