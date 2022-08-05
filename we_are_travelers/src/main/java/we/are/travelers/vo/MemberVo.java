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
	private String social_token; //소셜 토큰 정보
	private String social_naver; // 네이버(아이디)
	private String social_facebook;// 페이스북
	private String social_google; // 구글
	private String social_kakao; // 카카오
	private int member_grade; // 회원등급(일반/관리자)
	private int member_regCode; // 가입구분(일반/소셜)
	private int member_phone_auth; //휴대폰 인증상태
	private char member_delyn; //사용자 이용상태(N(정상) Y(삭제) S(정지))
	private Date member_regdate; //가입일자
	private String member_ip; //
    
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
	public String getSocial_token() {
		return social_token;
	}
	public void setSocial_token(String social_token) {
		this.social_token = social_token;
	}
	public String getSocial_naver() {
		return social_naver;
	}
	public void setSocial_naver(String social_naver) {
		this.social_naver = social_naver;
	}
	public String getSocial_facebook() {
		return social_facebook;
	}
	public void setSocial_facebook(String social_facebook) {
		this.social_facebook = social_facebook;
	}
	public String getSocial_google() {
		return social_google;
	}
	public void setSocial_google(String social_google) {
		this.social_google = social_google;
	}
	public String getSocial_kakao() {
		return social_kakao;
	}
	public void setSocial_kakao(String social_kakao) {
		this.social_kakao = social_kakao;
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
	public Object get(String string) {
		// TODO Auto-generated method stub
		return null;
	}

}