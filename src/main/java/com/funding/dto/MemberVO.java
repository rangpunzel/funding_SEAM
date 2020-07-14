package com.funding.dto;

import java.util.Date;

public class MemberVO {
	private int mem_num;  				//회원 번호
	private String mem_email; 			//회원 이메일
	private String mem_pw; 				//회원 비밀번호
	private String mem_name; 			//회원 이름
	private String mem_phone;			//회원 전화번호
	private String mem_profile_img;		//회원 프로필 경로
	private String mem_profile_ori; 	//회원 프로필 원본
	private Date mem_regdate;  			//회원 가입일자
	private Date mem_lastdate;			//회원 마지막 접속일자
	private int code_state_num;			//회원 상태 코드 번호
	private int code_num;				//회원코드 번호
	private String code_auth;			//회원코드권한
	private int login_fail_cnt;		//로그인 시도 실패 횟수

	private int com_num;				//업체번호
	private String com_bsns_name;		//사업자명
	private String com_bsns_rep_name;	//대표자명
	private String com_bsns_number;		//사업자등록번호
	private String com_bsns_phone;		//대표전화번호
	private String com_bsns_reg_license;//사업자등록증
	private String com_bsns_cert;		//소상공인 증명서
	
	private String code_state;			//회원 상태 코드(0610 JBR 추가)
	
	private String com_zipcode;
	private String com_addr1;
	private String com_addr2;
	
	private String uuid_key;			//메일 인증 키
	
	public MemberVO() {}
	public MemberVO(int mem_num, String mem_email, String mem_pw, String mem_name, String mem_phone,
			String mem_profile_img, String mem_profile_ori, Date mem_regdate, Date mem_lastdate, int code_state_num,
			int code_num, String code_auth, int login_fail_cnt, int com_num, String com_bsns_name,
			String com_bsns_rep_name, String com_bsns_number, String com_bsns_phone, String com_bsns_reg_license,
			String com_bsns_cert, String code_state, String com_zipcode, String com_addr1, String com_addr2,
			String uuid_key) {
		super();
		this.mem_num = mem_num;
		this.mem_email = mem_email;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_phone = mem_phone;
		this.mem_profile_img = mem_profile_img;
		this.mem_profile_ori = mem_profile_ori;
		this.mem_regdate = mem_regdate;
		this.mem_lastdate = mem_lastdate;
		this.code_state_num = code_state_num;
		this.code_num = code_num;
		this.code_auth = code_auth;
		this.login_fail_cnt = login_fail_cnt;
		this.com_num = com_num;
		this.com_bsns_name = com_bsns_name;
		this.com_bsns_rep_name = com_bsns_rep_name;
		this.com_bsns_number = com_bsns_number;
		this.com_bsns_phone = com_bsns_phone;
		this.com_bsns_reg_license = com_bsns_reg_license;
		this.com_bsns_cert = com_bsns_cert;
		this.code_state = code_state;
		this.com_zipcode = com_zipcode;
		this.com_addr1 = com_addr1;
		this.com_addr2 = com_addr2;
		this.uuid_key = uuid_key;
	}



	public int getMem_num() {
		return mem_num;
	}



	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}



	public String getMem_email() {
		return mem_email;
	}



	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}



	public String getMem_pw() {
		return mem_pw;
	}



	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}



	public String getMem_name() {
		return mem_name;
	}



	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}



	public String getMem_phone() {
		return mem_phone;
	}



	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}



	public String getMem_profile_img() {
		return mem_profile_img;
	}



	public void setMem_profile_img(String mem_profile_img) {
		this.mem_profile_img = mem_profile_img;
	}



	public String getMem_profile_ori() {
		return mem_profile_ori;
	}



	public void setMem_profile_ori(String mem_profile_ori) {
		this.mem_profile_ori = mem_profile_ori;
	}



	public Date getMem_regdate() {
		return mem_regdate;
	}



	public void setMem_regdate(Date mem_regdate) {
		this.mem_regdate = mem_regdate;
	}



	public Date getMem_lastdate() {
		return mem_lastdate;
	}



	public void setMem_lastdate(Date mem_lastdate) {
		this.mem_lastdate = mem_lastdate;
	}



	public int getCode_state_num() {
		return code_state_num;
	}



	public void setCode_state_num(int code_state_num) {
		this.code_state_num = code_state_num;
	}



	public int getCode_num() {
		return code_num;
	}



	public void setCode_num(int code_num) {
		this.code_num = code_num;
	}



	public String getCode_auth() {
		return code_auth;
	}



	public void setCode_auth(String code_auth) {
		this.code_auth = code_auth;
	}



	public int getLogin_fail_cnt() {
		return login_fail_cnt;
	}



	public void setLogin_fail_cnt(int login_fail_cnt) {
		this.login_fail_cnt = login_fail_cnt;
	}



	public int getCom_num() {
		return com_num;
	}



	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}



	public String getCom_bsns_name() {
		return com_bsns_name;
	}



	public void setCom_bsns_name(String com_bsns_name) {
		this.com_bsns_name = com_bsns_name;
	}



	public String getCom_bsns_rep_name() {
		return com_bsns_rep_name;
	}



	public void setCom_bsns_rep_name(String com_bsns_rep_name) {
		this.com_bsns_rep_name = com_bsns_rep_name;
	}



	public String getCom_bsns_number() {
		return com_bsns_number;
	}



	public void setCom_bsns_number(String com_bsns_number) {
		this.com_bsns_number = com_bsns_number;
	}



	public String getCom_bsns_phone() {
		return com_bsns_phone;
	}



	public void setCom_bsns_phone(String com_bsns_phone) {
		this.com_bsns_phone = com_bsns_phone;
	}



	public String getCom_bsns_reg_license() {
		return com_bsns_reg_license;
	}



	public void setCom_bsns_reg_license(String com_bsns_reg_license) {
		this.com_bsns_reg_license = com_bsns_reg_license;
	}



	public String getCom_bsns_cert() {
		return com_bsns_cert;
	}



	public void setCom_bsns_cert(String com_bsns_cert) {
		this.com_bsns_cert = com_bsns_cert;
	}



	public String getCode_state() {
		return code_state;
	}



	public void setCode_state(String code_state) {
		this.code_state = code_state;
	}



	public String getCom_zipcode() {
		return com_zipcode;
	}



	public void setCom_zipcode(String com_zipcode) {
		this.com_zipcode = com_zipcode;
	}



	public String getCom_addr1() {
		return com_addr1;
	}



	public void setCom_addr1(String com_addr1) {
		this.com_addr1 = com_addr1;
	}



	public String getCom_addr2() {
		return com_addr2;
	}



	public void setCom_addr2(String com_addr2) {
		this.com_addr2 = com_addr2;
	}



	public String getUuid_key() {
		return uuid_key;
	}



	public void setUuid_key(String uuid_key) {
		this.uuid_key = uuid_key;
	}



	@Override
	public String toString() {
		return "MemberVO [mem_num=" + mem_num + ", mem_email=" + mem_email + ", mem_pw=" + mem_pw + ", mem_name="
				+ mem_name + ", mem_phone=" + mem_phone + ", mem_profile_img=" + mem_profile_img + ", mem_profile_ori="
				+ mem_profile_ori + ", mem_regdate=" + mem_regdate + ", mem_lastdate=" + mem_lastdate
				+ ", code_state_num=" + code_state_num + ", code_num=" + code_num + ", code_auth=" + code_auth
				+ ", login_fail_cnt=" + login_fail_cnt + ", com_num=" + com_num + ", com_bsns_name=" + com_bsns_name
				+ ", com_bsns_rep_name=" + com_bsns_rep_name + ", com_bsns_number=" + com_bsns_number
				+ ", com_bsns_phone=" + com_bsns_phone + ", com_bsns_reg_license=" + com_bsns_reg_license
				+ ", com_bsns_cert=" + com_bsns_cert + ", code_state=" + code_state + ", com_zipcode=" + com_zipcode
				+ ", com_addr1=" + com_addr1 + ", com_addr2=" + com_addr2 + ", uuid_key=" + uuid_key + ", getMem_num()="
				+ getMem_num() + ", getMem_email()=" + getMem_email() + ", getMem_pw()=" + getMem_pw()
				+ ", getMem_name()=" + getMem_name() + ", getMem_phone()=" + getMem_phone() + ", getMem_profile_img()="
				+ getMem_profile_img() + ", getMem_profile_ori()=" + getMem_profile_ori() + ", getMem_regdate()="
				+ getMem_regdate() + ", getMem_lastdate()=" + getMem_lastdate() + ", getCode_state_num()="
				+ getCode_state_num() + ", getCode_num()=" + getCode_num() + ", getCode_auth()=" + getCode_auth()
				+ ", getLogin_fail_cnt()=" + getLogin_fail_cnt() + ", getCom_num()=" + getCom_num()
				+ ", getCom_bsns_name()=" + getCom_bsns_name() + ", getCom_bsns_rep_name()=" + getCom_bsns_rep_name()
				+ ", getCom_bsns_number()=" + getCom_bsns_number() + ", getCom_bsns_phone()=" + getCom_bsns_phone()
				+ ", getCom_bsns_reg_license()=" + getCom_bsns_reg_license() + ", getCom_bsns_cert()="
				+ getCom_bsns_cert() + ", getCode_state()=" + getCode_state() + ", getCom_zipcode()=" + getCom_zipcode()
				+ ", getCom_addr1()=" + getCom_addr1() + ", getCom_addr2()=" + getCom_addr2() + ", getUuid_key()="
				+ getUuid_key() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}


	
	
	
}
	