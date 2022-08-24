package we.are.travelers.vo;

import java.util.Date;

public class MemberVo {
	
	private String member_idx=""; // 회원 고유번호
	private String member_id; // 아이디(이메일)
	private String member_pwd; // 비밀번호
	private String member_name; // 이름
	private String member_nick; // 닉네임
	private String member_birth; // 생년월일
	private String member_phone; // 휴대폰
	private int member_grade; // 회원등급(일반/관리자)
	private int member_regCode; // 가입구분(일반/소셜)
	private int member_phone_auth; //휴대폰 인증상태
	private char member_delyn; //사용자 이용상태(N(정상) Y(삭제) S(정지))
	private Date member_regdate; //가입일자
	private String member_ip; //
	private String address_input1;
	private String address_input2;
	private String address_input3;
	private String address_input4;
	private String member_address;
    
	public String getMember_idx() {
		return member_idx;		
	}
	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}
		       
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public int getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(int member_grade) {
		this.member_grade = member_grade;
	}
	public int getMember_regCode() {
		return member_regCode;
	}
	public void setMember_regCode(int member_regCode) {
		this.member_regCode = member_regCode;
	}
	public int getMember_phone_auth() {
		return member_phone_auth;
	}
	public void setMember_phone_auth(int member_phone_auth) {
		this.member_phone_auth = member_phone_auth;
	}
	public char getMember_delyn() {
		return member_delyn;
	}
	public void setMember_delyn(char member_delyn) {
		this.member_delyn = member_delyn;
	}
	public Date getMember_regdate() {
		return member_regdate;
	}
	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}
	public String getMember_ip() {
		return member_ip;
	}
	public void setMember_ip(String member_ip) {
		this.member_ip = member_ip;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	
	@Override
	public String toString() {
		return "MemberVo [member_idx=" + member_idx + ", member_id=" + member_id + ", member_pwd=" + member_pwd
				+ ", member_name=" + member_name + ", member_nick=" + member_nick + ", member_birth=" + member_birth
				+ ", member_phone=" + member_phone + ", member_grade=" + member_grade + ", member_regCode="
				+ member_regCode + ", member_phone_auth=" + member_phone_auth + ", member_delyn=" + member_delyn
				+ ", member_regdate=" + member_regdate + ", member_ip=" + member_ip + "]";
	}
	public String getAddress_input1() {
		return address_input1;
	}
	public void setAddress_input1(String address_input1) {
		this.address_input1 = address_input1;
	}
	public String getAddress_input2() {
		return address_input2;
	}
	public void setAddress_input2(String address_input2) {
		this.address_input2 = address_input2;
	}
	public String getAddress_input3() {
		return address_input3;
	}
	public void setAddress_input3(String address_input3) {
		this.address_input3 = address_input3;
	}
	public String getAddress_input4() {
		return address_input4;
	}
	public void setAddress_input4(String address_input4) {
		this.address_input4 = address_input4;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String address_input5) {
		this.member_address = address_input5;
	}
	
      
}