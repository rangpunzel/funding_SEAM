package com.funding.request;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.funding.dto.Pjt_bank_sum_attachVO;
import com.funding.dto.ProjectVO;

public class PjtRegistRequest {
	private int pjt_num;			//프로젝트 번호
	private String pjt_title;		//제목
	private String pjt_contents;	//내용
	private int pjt_cash;			//프로젝트 목표 금액
	private String pjt_int_rate;	//투자이자율
	private Date pjt_startdate;		//시작일
	private Date pjt_enddate;		//종료일
	private Date pjt_calcdate;		//정산일
	private Date pjt_regdate;		//작성일
	private Date pjt_moddate;		//수정일
	private int pjt_view_cnt;		//조회수
	private int pjt_thumbsup;		//추천수
	private int pjt_enabled;		//활성화여부
	private String pjt_category;	//카테고리
	private int pjt_type_code;		//분류코드 (기부,대출)
	private int pjt_state_code;		//진행상태코드(미승인,승인)
	private int mem_num;			//회원번호
	private String pjt_state_comment;//보류메시지
	
	private String comName; //사업장명
	
	private MultipartFile pjt_atc_bankbook_name;	//통장 사본
	private MultipartFile pjt_atc_sum_name;			//대표이미지
	public int getPjt_num() {
		return pjt_num;
	}
	public void setPjt_num(int pjt_num) {
		this.pjt_num = pjt_num;
	}
	public String getPjt_title() {
		return pjt_title;
	}
	public void setPjt_title(String pjt_title) {
		this.pjt_title = pjt_title;
	}
	public String getPjt_contents() {
		return pjt_contents;
	}
	public void setPjt_contents(String pjt_contents) {
		this.pjt_contents = pjt_contents;
	}
	public int getPjt_cash() {
		return pjt_cash;
	}
	public void setPjt_cash(int pjt_cash) {
		this.pjt_cash = pjt_cash;
	}
	public String getPjt_int_rate() {
		return pjt_int_rate;
	}
	public void setPjt_int_rate(String pjt_int_rate) {
		this.pjt_int_rate = pjt_int_rate;
	}
	public Date getPjt_startdate() {
		return pjt_startdate;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public void setPjt_startdate(Date pjt_startdate) {
		this.pjt_startdate = pjt_startdate;
	}
	public Date getPjt_enddate() {
		return pjt_enddate;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public void setPjt_enddate(Date pjt_enddate) {
		this.pjt_enddate = pjt_enddate;
	}
	public Date getPjt_calcdate() {
		return pjt_calcdate;
	}
	public void setPjt_calcdate(Date pjt_calcdate) {
		this.pjt_calcdate = pjt_calcdate;
	}
	public Date getPjt_regdate() {
		return pjt_regdate;
	}
	public void setPjt_regdate(Date pjt_regdate) {
		this.pjt_regdate = pjt_regdate;
	}
	public Date getPjt_moddate() {
		return pjt_moddate;
	}
	public void setPjt_moddate(Date pjt_moddate) {
		this.pjt_moddate = pjt_moddate;
	}
	public int getPjt_view_cnt() {
		return pjt_view_cnt;
	}
	public void setPjt_view_cnt(int pjt_view_cnt) {
		this.pjt_view_cnt = pjt_view_cnt;
	}
	public int getPjt_thumbsup() {
		return pjt_thumbsup;
	}
	public void setPjt_thumbsup(int pjt_thumbsup) {
		this.pjt_thumbsup = pjt_thumbsup;
	}
	public int getPjt_enabled() {
		return pjt_enabled;
	}
	public void setPjt_enabled(int pjt_enabled) {
		this.pjt_enabled = pjt_enabled;
	}
	public String getPjt_category() {
		return pjt_category;
	}
	public void setPjt_category(String pjt_category) {
		this.pjt_category = pjt_category;
	}
	public int getPjt_type_code() {
		return pjt_type_code;
	}
	public void setPjt_type_code(int pjt_type_code) {
		this.pjt_type_code = pjt_type_code;
	}
	public int getPjt_state_code() {
		return pjt_state_code;
	}
	public void setPjt_state_code(int pjt_state_code) {
		this.pjt_state_code = pjt_state_code;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getPjt_state_comment() {
		return pjt_state_comment;
	}
	public void setPjt_state_comment(String pjt_state_comment) {
		this.pjt_state_comment = pjt_state_comment;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public MultipartFile getPjt_atc_bankbook_name() {
		return pjt_atc_bankbook_name;
	}
	public void setPjt_atc_bankbook_name(MultipartFile pjt_atc_bankbook_name) {
		this.pjt_atc_bankbook_name = pjt_atc_bankbook_name;
	}
	public MultipartFile getPjt_atc_sum_name() {
		return pjt_atc_sum_name;
	}
	public void setPjt_atc_sum_name(MultipartFile pjt_atc_sum_name) {
		this.pjt_atc_sum_name = pjt_atc_sum_name;
	}
	
	public PjtRegistRequest() {	}
	
	public ProjectVO toProjectVO() {
		ProjectVO project = new ProjectVO();
		project.setPjt_num(pjt_num);
		project.setMem_num(mem_num);
		project.setPjt_cash(pjt_cash);
		project.setPjt_category(pjt_category);
		project.setPjt_title(pjt_title);
		project.setPjt_contents(pjt_contents);
		project.setPjt_startdate(pjt_startdate);
		project.setPjt_enddate(pjt_enddate);
		project.setPjt_type_code(pjt_type_code);
		project.setComName(comName);
		
		return project;
	}
	
	@Override
	public String toString() {
		return "PjtRegistRequest [pjt_num=" + pjt_num + ", pjt_title=" + pjt_title + ", pjt_contents=" + pjt_contents
				+ ", pjt_cash=" + pjt_cash + ", pjt_int_rate=" + pjt_int_rate + ", pjt_startdate=" + pjt_startdate
				+ ", pjt_enddate=" + pjt_enddate + ", pjt_calcdate=" + pjt_calcdate + ", pjt_regdate=" + pjt_regdate
				+ ", pjt_moddate=" + pjt_moddate + ", pjt_view_cnt=" + pjt_view_cnt + ", pjt_thumbsup=" + pjt_thumbsup
				+ ", pjt_enabled=" + pjt_enabled + ", pjt_category=" + pjt_category + ", pjt_type_code=" + pjt_type_code
				+ ", pjt_state_code=" + pjt_state_code + ", mem_num=" + mem_num + ", pjt_state_comment="
				+ pjt_state_comment + ", comName=" + comName + ", pjt_atc_bankbook_name=" + pjt_atc_bankbook_name
				+ ", pjt_atc_sum_name=" + pjt_atc_sum_name + "]";
	}

	
	
}
