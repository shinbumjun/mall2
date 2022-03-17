package com.gura.spring.movie.dto;

import org.springframework.web.multipart.MultipartFile;

public class MovieDto {

	private int num;
	private String title;
	private String writer;
	private int price;
	private int buyNum;
	private String category;
	private float score;
	private String releaseDate;
	private String content;
	private String imagePath;
	private String regdate;
	private int startRowNum;
	private int endRowNum;
	private int prevNum; //이전글의 글번호
	private int nextNum; //다음글의 글번호
	private MultipartFile image;	//이미지 파일 업로드 처리를 위한 필드
	
	//디폴트 생성자 
	public MovieDto() {}
	
	public MovieDto(int num, String title, String writer, int price, int buyNum, String category, float score,
			 String releaseDate, String content, String imagePath, String regdate,
			int startRowNum, int endRowNum, int prevNum, int nextNum, MultipartFile image) {
		super();
		this.num = num;
		this.title = title;
		this.writer = writer;
		this.price = price;
		this.buyNum = buyNum;
		this.category = category;
		this.score = score;
		this.releaseDate = releaseDate;
		this.content = content;
		this.imagePath = imagePath;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
		this.image = image;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
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

	public int getPrevNum() {
		return prevNum;
	}

	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}

	public int getNextNum() {
		return nextNum;
	}

	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

}
