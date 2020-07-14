package com.funding.dto;

import java.util.Date;
import java.util.List;

public class NoticeVO {
	
	private int notice_num;          //글넘버
	private String notice_title;	 //제목
	private String notice_contents;  //내용
	private Date notice_regdate;     //등록일
	private Date notice_moddate;	 //수정일
	private int notice_view_cnt;	 //조회수
	private int mem_num;			 //작성자
	private int notice_point;		 //중요글 (1:중요 0:일반)
	private String prev_notice_title;   //이전글
	private String next_notice_title;   //다음글
	private int prev_notice_num;
	private int next_notice_num;
	
	

	private List<Notice_atcVO> attachList;  //첨부파일리스트
	
	
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_contents() {
		return notice_contents;
	}
	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
	}
	public Date getNotice_regdate() {
		return notice_regdate;
	}
	public void setNotice_regdate(Date notice_regdate) {
		this.notice_regdate = notice_regdate;
	}
	public Date getNotice_moddate() {
		return notice_moddate;
	}
	public void setNotice_moddate(Date notice_moddate) {
		this.notice_moddate = notice_moddate;
	}
	
	public int getNotice_view_cnt() {
		return notice_view_cnt;
	}
	public void setNotice_view_cnt(int notice_view_cnt) {
		this.notice_view_cnt = notice_view_cnt;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getPrev_notice_title() {
		return prev_notice_title;
	}
	public void setPrev_notice_title(String prev_notice_title) {
		this.prev_notice_title = prev_notice_title;
	}
	public String getNext_notice_title() {
		return next_notice_title;
	}
	public void setNext_notice_title(String next_notice_title) {
		this.next_notice_title = next_notice_title;
	}
	
	public int getPrev_notice_num() {
		return prev_notice_num;
	}
	public void setPrev_notice_num(int prev_notice_num) {
		this.prev_notice_num = prev_notice_num;
	}
	public int getNext_notice_num() {
		return next_notice_num;
	}
	public void setNext_notice_num(int next_notice_num) {
		this.next_notice_num = next_notice_num;
	}
	public int getNotice_point() {
		return notice_point;
	}
	public void setNotice_point(int notice_point) {
		this.notice_point = notice_point;
	}
	public List<Notice_atcVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<Notice_atcVO> attachList) {
		this.attachList = attachList;
	}



	
	
	@Override
	public String toString() {
		return "NoticeVO [notice_num=" + notice_num + ", notice_title=" + notice_title + ", notice_contents="
				+ notice_contents + ", notice_regdate=" + notice_regdate + ", notice_moddate=" + notice_moddate
				+ ", notice_view_cnt=" + notice_view_cnt + ", mem_num=" + mem_num + ", notice_point=" + notice_point
				+ ", prev_notice_title=" + prev_notice_title + ", next_notice_title=" + next_notice_title
				+ ", prev_notice_num=" + prev_notice_num + ", next_notice_num=" + next_notice_num + ", attachList="
				+ attachList + "]";
	}
	
	
	public NoticeVO(int notice_num, String notice_title, String notice_contents, Date notice_regdate,
			Date notice_moddate, int notice_view_cnt, int mem_num, int notice_point, String prev_notice_title,
			String next_notice_title, int prev_notice_num, int next_notice_num, List<Notice_atcVO> attachList) {
		super();
		this.notice_num = notice_num;
		this.notice_title = notice_title;
		this.notice_contents = notice_contents;
		this.notice_regdate = notice_regdate;
		this.notice_moddate = notice_moddate;
		this.notice_view_cnt = notice_view_cnt;
		this.mem_num = mem_num;
		this.notice_point = notice_point;
		this.prev_notice_title = prev_notice_title;
		this.next_notice_title = next_notice_title;
		this.prev_notice_num = prev_notice_num;
		this.next_notice_num = next_notice_num;
		this.attachList = attachList;
	}
	public NoticeVO() {
		
	}

	

	
	
	
	
}
