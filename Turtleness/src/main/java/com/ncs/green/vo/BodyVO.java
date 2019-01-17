package com.ncs.green.vo;

public class BodyVO {
	private String id;
	private float height;
	private float weight;
	private int pushup;
	private int situp;
	private String weekexercise;
	private String doexercise;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public float getHeight() {
		return height;
	}
	public void setHeight(float height) {
		this.height = height;
	}
	public float getWeight() {
		return weight;
	}
	public void setWeight(float weight) {
		this.weight = weight;
	}
	public int getPushup() {
		return pushup;
	}
	public void setPushup(int pushup) {
		this.pushup = pushup;
	}
	public int getSitup() {
		return situp;
	}
	public void setSitup(int situp) {
		this.situp = situp;
	}
	public String getWeekexercise() {
		return weekexercise;
	}
	public void setWeekexercise(String weekexercise) {
		this.weekexercise = weekexercise;
	}
	public String getDoexercise() {
		return doexercise;
	}
	public void setDoexercise(String doexercise) {
		this.doexercise = doexercise;
	}
	
	@Override
	public String toString() {
		return "BodyVO [id=" + id + ", height=" + height + ", weight=" + weight + ", pushup=" + pushup + ", situp="
				+ situp + ", weekexercise=" + weekexercise + ", doexercise=" + doexercise + "]";
	}
}
