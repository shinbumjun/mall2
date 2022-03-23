package com.gura.spring.buy.dto;

public class BuyDto {

	private int num;
	private String title;
	private String id;
	private int price;
	private int buyNum;
	private int score;
	private String releaseDate;
	private int startRowNum;
	private int	endRowNum;
	private String regdate;
	
	public BuyDto() {}

	public BuyDto(int num, String title, String id, int price, int buyNum, int score, String releaseDate,
			int startRowNum, int endRowNum, String regdate) {
		super();
		this.num = num;
		this.title = title;
		this.id = id;
		this.price = price;
		this.buyNum = buyNum;
		this.score = score;
		this.releaseDate = releaseDate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.regdate = regdate;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getBuyNum() {
		return buyNum;
	}

	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	};
	
	
}
