-- 멤버테이블
CREATE TABLE member (
	member_no number primary key,
	member_email VARCHAR2(40) not NULL unique,
	member_password	VARCHAR2(60) not NULL,
	member_gender char(1) not null,
	member_nick	VARCHAR2(20) not NULL unique,
	member_phone	CHAR(11) not NULL unique,
	member_grade	VARCHAR(18) default '일반회원' check(member_grade in ('일반회원', '비즈니스회원', '관리자')),
	member_private	char(1) default 0 not null,
	--member_highschool	VARCHAR2(90),
	--member_university	VARCHAR2(90),
	member_interest	VARCHAR2(9) check(member_interest in ('예술','패션','요리','스포츠','뷰티','여행')) 
);

create sequence member_seq;

-- 비즈니스 테이블 ---------------------------------------- 나중에 더 봐야함 --
CREATE TABLE business_member (
	member_no	references member(member_no) on delete cascade not null,
	business_bankcount char(30)	not NULL
);


-- 디엠 메세지 ------------------------------------------
CREATE TABLE dm (
	dm_no	number primary key,
	dm_content	VARCHAR2(1500) not NULL
);

create sequence dm_seq;


-- 채팅방 ------------------------------------------
create table room (
room_no number primary key
);

create sequence room_seq;
-- 참가자 ------------------------------------------
create table room_enter(
member_no REFERENCES member(member_no) on delete set null,
room_no REFERENCES room(room_no) on delete set null,
room_enter_time date default sysdate not null,
room_enter_is char(1) default 0 not null
);
-- 메세지 기록 ------------------------------------------
create table dm_record(
dm_no REFERENCES dm(dm_no) on delete cascade,
who REFERENCES member(member_no) on delete set null,
target REFERENCES member(member_no) on delete set null,
dm_record_time date default sysdate,
dm_record_check char(1) default 0 not null
);




--댓글 테이블 ------------------------------------구현하면서 추가 수정 ------
CREATE TABLE reply (
	reply_no	number	primary key,
	reply_content	VARCHAR2(300) not null,
	super_no number	default 0 not NULL,
	reply_date	date default sysdate not NULL,
	reply_check	char(1) default 0 not NULL
);

create sequence reply_seq;
---게시물 테이블 -----------------------------------------
CREATE TABLE board (
	board_no	number primary key,
	member_no	references member(member_no) on delete cascade,
	board_date	date default sysdate	not NULL,
	board_content	VARCHAR2(3000) not null,
	board_is_reply	char(1) default 0 not null 
);

create sequence board_seq;
-- 첨부파일 테이블 ------------------------------------------
CREATE TABLE attach (
attach_no number primary key,
attach_uploadname varchar2(256) not null,
attach_type varchar2(256) not null,
attach_size number default 0 not null
);

create sequence attach_seq;

---게시물 좋아요 테이블 -----------------------------------------
CREATE TABLE board_like (
	member_no	references member(member_no) on delete cascade,
	board_no	references board(board_no) on delete cascade,
	board_like_check char(1) default 0 not null
);

--- 팔로우 테이블 -----------------------------------------
CREATE TABLE follow (
	follow_who references member(member_no) on delete cascade,
	follow_target	references member(member_no) on delete cascade,
	follow_date	date default sysdate not NULL,
	follow_confirm	char(1) default 0 not NULL,
	follow_check	char(1) default 0 not NULL,
    check(follow_who != follow_target)
);

--------------------------------------------
--CREATE TABLE story (
--	story_no	VARCHAR(255)	NOT NULL,
--	member_no	VARCHAR(255)	NOT NULL,
--	story_date	VARCHAR(255)	NULL,
--	story_see	VARCHAR(255)	NULL
--);
--------------------------------------------
--CREATE TABLE story_attach (
--	story_no	VARCHAR(255)	NOT NULL,
--	attach_no	VARCHAR(255)	NOT NULL
--);
--------------------------------------------
--CREATE TABLE story_see (
--	member_no  NOT NULL,
--	story_no	VARCHAR(255)	NOT NULL
--);
--- 게시물 파일 테이블 -----------------------------------------
CREATE TABLE board_attach (
	board_attach_no number primary key,
	board_no references board(board_no) on delete cascade,
	attach_no references attach(attach_no) on delete cascade
);

create sequence board_attach_seq;
-- 광고 게시물 테이블 ------------------------------------------
CREATE TABLE board_ad (
	board_ad_no	number primary key,
	member_no references member(member_no) on delete cascade,
	ad_no	references ad(ad_no) on delete set null,
	board_ad_date	date default sysdate not NULL,
	board_ad_content	VARCHAR2(3000) not null,
	board_ad_link	VARCHAR2(255),
	board_ad_count	number not NULL
	board_ad_check VARCHAR2(21) default '신청 완료' NOT NULL
	board_ad_is_reply	char(1) default 0 not null
	-- board_category	VARCHAR2(30) not NULL
);

create sequence board_ad_seq;
--- 게시물 사람 태그 테이블 (0628 삭제) -----------------------------------------
CREATE TABLE board_tag (
	board_attach_no	references board_attach(board_attach_no) on delete cascade	NOT NULL,
	board_tag_member_no	references member(member_no) on delete cascade not null
	--Field2	VARCHAR(255)	NULL,
	--Field3	VARCHAR(255)	NULL
);

--- (0628) 수정 (board_tag 삭제, 아래 board_member_tag 생성)
CREATE TABLE board_member_tag (
	board_no references board(board_no) on delete cascade not null,
	member_no references member(member_no) on delete cascade not null
);

--- #태그 게시물 -----------------------------------------
CREATE TABLE hashtag (
	hashtag_no	number primary key,
	hashtag_name	VARCHAR2(90) not null
);

create sequence hashtag_seq;

--- 게시물-해시태그 ---------------------------------------
create table board_hashtag(
    board_no references board(board_no) on delete cascade,
    hashtag_no references hashtag(hashtag_no) on delete cascade
);

--- 광고게시물-해시태그(0703 생성)---------------------------------------
create table board_ad_hashtag(
    board_ad_no references board_ad(board_ad_no) on delete cascade,
    hashtag_no references hashtag(hashtag_no) on delete cascade
);

--- 회원 차단 테이블 -----------------------------------------
CREATE TABLE block (
	member_no references member(member_no) on delete cascade,
	block_no references member(member_no) on delete cascade,
	check (member_no != block_no)
);
--- 광고 종류 테이블 -----------------------------------------
CREATE TABLE ad (
	ad_no	number primary key,
	ad_count	number	not NULL unique,
	ad_price	number	not NULL
);

create sequence ad_seq;
---- 광고 게시글 댓글 테이블 ----------------------------------------
CREATE TABLE board_ad_reply (
	reply_no	references reply(reply_no) on delete cascade,
	board_ad_no	references board_ad(board_ad_no) on delete cascade
);
---- 일반 게시글 댓글 테이블 ----------------------------------------
CREATE TABLE board_reply (
	reply_no	references reply(reply_no) on delete cascade,
	board_no	references board(board_no) on delete cascade
);
---- 저장된 게시글 테이블 ----------------------------------------
CREATE TABLE board_save (
	board_no references board(board_no) on delete cascade,
	member_no	references member(member_no) on delete cascade
);
----- 광고 시청 이력 테이블 ---------------------------------------
CREATE TABLE board_ad_check (
	member_no	references member(member_no) on delete cascade,
	board_ad_no	references board_ad(board_ad_no) on delete cascade
);
----- 회원 프로필 사진 테이블 ---------------------------------------
CREATE TABLE member_profile (
	member_no	references member(member_no) on delete cascade,
	attach_no	references attach(attach_no) on delete cascade
);
-------------------------------------------
CREATE TABLE dm_record (
	member_no	references member(member_no) on delete cascade,
	dm_no	references dm(dm_no) on delete cascade
);

----- 검색 이력 테이블 ---------------------------------------
CREATE TABLE search (
	member_no	references member(member_no) on delete cascade,
	search_key	VARCHAR2(255) not null,
    primary key(member_no, search_key)
);
----------------------------------- 결제 테이블 만들 때 수정 ---------
--CREATE TABLE payment (
--	payment_no	number	NOT NULL,
--	payment_tid	varchar2(20)	NULL,
--	payment_total	number	NULL,
--	payment_name	varchar2(90)	NULL,
--	payment_time	date	NULL
--);
------------------------------------- 결제 테이블 만들 때 수정 ---------
--CREATE TABLE payment_detail (
--	payment_detail_no	number	NOT NULL,
--	payment_no	number	NOT NULL,
--	payment_detail_name	varchar2(90)	NULL,
--	payment_detail_quantity	number	NULL,
--	payment_detail_price	number	NULL
--);
------ 게시글 광고 첨부파일 --------------------------------------
CREATE TABLE board_ad_attach (
	board_ad_attach_no number primary key,
	board_ad_no references board_ad(board_ad_no) on delete cascade,
	attach_no references attach(attach_no) on delete cascade
);

create sequence board_ad_attach_seq;
------ 광고 게시물 좋아요 --------------------------------------
CREATE TABLE ad_like (
	board_ad_no	references board_ad(board_ad_no) on delete cascade,
	member_no	references member(member_no) on delete cascade,
	ad_like_check	char(1) default 0 not null
);

------ 인증 테이블 ---------------------------------------------
CREATE TABLE cert(
cert_target varchar2(100) PRIMARY key,
cert_number char(6) NOT NULL CHECK(regexp_like(cert_number, '^[0-9]{6}$')),
cert_time DATE DEFAULT sysdate NOT null
);