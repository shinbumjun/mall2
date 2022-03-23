package com.gura.spring.users;

public class UsersDto {

	private String id;
	private String pwd;
	private String email;
	private String profile;
	private String regdate;
	private String newPwd;
	private String adminNum;
	private int point;
	private int startRowNum;
	private int	endRowNum;
	private String idWord;
	private int price;
	
	public UsersDto () {}

	public UsersDto(String id, String pwd, String email, String profile, String regdate, String newPwd, String adminNum,
			int point, int startRowNum, int endRowNum, String idWord, int price) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.profile = profile;
		this.regdate = regdate;
		this.newPwd = newPwd;
		this.adminNum = adminNum;
		this.point = point;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.idWord = idWord;
		this.price = price;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getIdWord() {
		return idWord;
	}

	public void setIdWord(String idWord) {
		this.idWord = idWord;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String getAdminNum() {
		return adminNum;
	}

	public void setAdminNum(String adminNum) {
		this.adminNum = adminNum;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	};
	
	
}
