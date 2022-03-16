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

