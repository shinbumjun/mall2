CREATE TABLE board_movie(
	num NUMBER PRIMARY KEY,
	title VARCHAR2(100) NOT NULL, --제목 0
	writer VARCHAR2(100) NOT NULL, --작성자 (로그인된 아이디)
	price NUMBER, --상품가격 0
	buyNum NUMBER, --구매횟수
	category  VARCHAR2(100), --카테고리 0
	score FLOAT, --리뷰 점수
	releaseDate VARCHAR2(100), --개봉일 0
	content CLOB, -- 글내용 0
	imagePath VARCHAR2(100), -- 영화 이미지의 경로  ex) /upload/xxx.jpg 0
	regdate DATE -- 업로드 날짜 
);

CREATE SEQUENCE board_movie_seq; 
-------------------------------------------------------------------------
--테이블 완성
-- 공지사항 저장할 테이블 
CREATE TABLE board_notice(
	num NUMBER PRIMARY KEY, --글번호
	writer VARCHAR2(100) NOT NULL, --작성자
	title VARCHAR2(100) NOT NULL, --제목
	content CLOB, --글 내용
	viewCount NUMBER, -- 조회수
	regdate DATE --글 작성일
);
-- 공지사항 번호를 얻어낼 시퀀스
CREATE SEQUENCE board_notice_seq; 
