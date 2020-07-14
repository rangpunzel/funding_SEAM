package com.funding.dto;

import java.util.Date;

public class QnAVO {
	
	private int qna_num;
	private String qna_title;
	private String qna_contents;
	private Date qna_regdate;
	private int qna_view_cnt;
	private int mem_num;
	private Date qna_moddate;
	private int qna_secret;
	private String qna_pwd;
	private int qna_cmts_num;
	private String mem_name;
	private int qna_enabled;
	private String mem_email;
	
	
	
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_contents() {
		return qna_contents;
	}
	public void setQna_contents(String qna_contents) {
		this.qna_contents = qna_contents;
	}
	public Date getQna_regdate() {
		return qna_regdate;
	}
	public void setQna_regdate(Date qna_regdate) {
		this.qna_regdate = qna_regdate;
	}
	public int getQna_view_cnt() {
		return qna_view_cnt;
	}
	public void setQna_view_cnt(int qna_view_cnt) {
		this.qna_view_cnt = qna_view_cnt;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public Date getQna_moddate() {
		return qna_moddate;
	}
	public void setQna_moddate(Date qna_moddate) {
		this.qna_moddate = qna_moddate;
	}
	public int getQna_secret() {
		return qna_secret;
	}
	public void setQna_secret(int qna_secret) {
		this.qna_secret = qna_secret;
	}
	public String getQna_pwd() {
		return qna_pwd;
	}
	public void setQna_pwd(String qna_pwd) {
		this.qna_pwd = qna_pwd;
	}
	public int getQna_cmts_num() {
		return qna_cmts_num;
	}
	public void setQna_cmts_num(int qna_cmts_num) {
		this.qna_cmts_num = qna_cmts_num;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public int getQna_enabled() {
		return qna_enabled;
	}
	public void setQna_enabled(int qna_enabled) {
		this.qna_enabled = qna_enabled;
	}
	
	
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	@Override
	public String toString() {
		return "QnAVO [qna_num=" + qna_num + ", qna_title=" + qna_title + ", qna_contents=" + qna_contents
				+ ", qna_regdate=" + qna_regdate + ", qna_view_cnt=" + qna_view_cnt + ", mem_num=" + mem_num
				+ ", qna_moddate=" + qna_moddate + ", qna_secret=" + qna_secret + ", qna_pwd=" + qna_pwd
				+ ", qna_cmts_num=" + qna_cmts_num + ", mem_name=" + mem_name + ", qna_enabled=" + qna_enabled 
				+ ", mem_email=" + mem_email + " ]";
	}
	
	
	

}
