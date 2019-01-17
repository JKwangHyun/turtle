package com.ncs.green.vo;

public class InquiryVO {
	private int seq;
	private String wid;
	private String title;
	private String titleF;
	private String content;
	private String regdate;
	private int root;
	private int step;
	private int indent;
	
	public String getTitleF() {
		return titleF;
	}
	public void setTitleF(String titleF) {
		this.titleF = titleF;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getWid() {
		return wid;
	}
	public void setWid(String wid) {
		this.wid = wid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getRoot() {
		return root;
	}
	public void setRoot(int root) {
		this.root = root;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	
	@Override
	public String toString() {
		return "InquiryVO [seq=" + seq + ", wid=" + wid + ", title=" + title + ", content=" + content + ", regdate="
				+ regdate + ", root=" + root + ", step=" + step + ", indent=" + indent + "]";
	}
}
