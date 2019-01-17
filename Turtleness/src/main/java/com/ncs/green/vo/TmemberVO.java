package com.ncs.green.vo;

public class TmemberVO {
	private String id ;
	private String password ;
	private String name ;
	private String birthd ;
	private String birthd1 ;
	private String birthd2;
	private String gender;
	
	public String getBirthd1() {
		return birthd1;
	}
	public void setBirthd1(String birthd1) {
		this.birthd1 = birthd1;
	}
	public String getBirthd2() {
		return birthd2;
	}
	public void setBirthd2(String birthd2) {
		this.birthd2 = birthd2;
	}
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthd() {
		return birthd;
	}
	public void setBirthd(String birthd) {
		this.birthd = birthd;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	@Override
	public String toString() {
		return "TmemberVO [id=" + id + ", password=" + password + ", name=" + name + ", birthd=" + birthd + ", gender="
				+ gender + "]";
	}
}