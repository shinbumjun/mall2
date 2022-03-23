package com.gura.spring.qna.dto;

public class QnaDto {

	private int num;
	private String writer;
	private String title;
	private String content;
	private int viewCount;
	private String regdate;
	private int startRowNum;
	private int endRowNum;
	private int prevNum;
	private int nextNum;
	
	public QnaDto() {}

	public QnaDto(int num, String title, String writer, String content, int viewCount, String regdate,
			int startRowNum, int endRowNum, int prevNum, int nextNum) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.viewCount = viewCount;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
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

	@Override
	public String toString() {
		return "QnaDto [num=" + num + ", title=\" + title + \", writer=" + writer + ", content=" + content
				+ ", viewCount=" + viewCount + ", regdate=" + regdate + ", startRowNum=" + startRowNum + ", endRowNum="
				+ endRowNum + ", prevNum=" + prevNum + ", nextNum=" + nextNum + "]";
	}

	
}