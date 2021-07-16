--*************************************
-- 모든 테이블 조회, 모든 SEQUENCE 조회
SELECT * FROM tab;
SELECT * FROM USER_SEQUENCES;
SELECT * FROM all_objects WHERE object_type = 'SEQUENCE';
--*************************************

--*************************************
-- 모든 TABLE 삭제 (생성 역순)
DROP TABLE pay;
DROP TABLE post;
DROP TABLE line;
DROP TABLE movielike;
DROP TABLE comments;
DROP TABLE attach_files;
DROP TABLE board;
DROP TABLE board_type;
DROP TABLE account_type;
DROP TABLE reservation;
DROP TABLE account;
DROP TABLE seat;
DROP TABLE time;
DROP TABLE image_files;
DROP TABLE movie_theater;
DROP TABLE theater;
DROP TABLE branch;
DROP TABLE movie;
--*************************************

--*************************************
-- 모든 SEQUENCE 삭제
DROP SEQUENCE board_seq;
DROP SEQUENCE board_type_seq;
DROP SEQUENCE branch_seq;
DROP SEQUENCE image_files_seq;
DROP SEQUENCE merge_seq;
DROP SEQUENCE movie_seq;
DROP SEQUENCE movie_t_seq;
DROP SEQUENCE post_seq;
DROP SEQUENCE res_seq;
DROP SEQUENCE seat_seq;
DROP SEQUENCE theater_seq;
DROP SEQUENCE time_seq;
DROP SEQUENCE line_seq;
DROP SEQUENCE pay_seq;
DROP SEQUENCE account_seq;
--*************************************

--*************************************
-- ▼▼▼▼▼ 여기서부터 모든 TABLE 생성

-- 영화 테이블
CREATE TABLE movie(
    id NUMBER,
    title VARCHAR2(256),
    subtitle VARCHAR2(256),
    summary NVARCHAR2(1024),
    type VARCHAR2(64),
    director VARCHAR2(64),
    genre  VARCHAR2(128),
    runningtime NUMBER DEFAULT 0,
    rating NUMBER DEFAULT 0,
    actor NVARCHAR2(512),
    playdate date,
    rcnt NUMBER DEFAULT 0,
    gcnt NUMBER DEFAULT 0,
    grade NUMBER DEFAULT 0
);

ALTER TABLE movie ADD CONSTRAINT movie_id_pk PRIMARY KEY(id);

COMMENT ON COLUMN movie.id IS '영화의 식별번호';
COMMENT ON COLUMN movie.title IS '영화의 제목';
COMMENT ON COLUMN movie.summary IS '영화의 줄거리 요약';
COMMENT ON COLUMN movie.type IS '영화의 상영 종류(2D, 3D)';
COMMENT ON COLUMN movie.director IS '영화의 감독';
COMMENT ON COLUMN movie.genre IS '영화의 장르';
COMMENT ON COLUMN movie.runningtime IS '영화의 상영시간';
COMMENT ON COLUMN movie.rating IS '영화의 등급(나이제한)';
COMMENT ON COLUMN movie.actor IS '영화의 출연진';
COMMENT ON COLUMN movie.playdate IS '영화의 개봉일';
COMMENT ON COLUMN movie.rcnt IS '영화의 예매 수';
COMMENT ON COLUMN movie.gcnt IS '영화의 좋아요 수';
COMMENT ON COLUMN movie.grade IS '영화의 평점';

-- 영화관(지점) 테이블
CREATE TABLE branch (
    id number,
    location VARCHAR2(64),
    name VARCHAR2(128)
);

ALTER TABLE branch ADD CONSTRAINT branch_id_pk PRIMARY KEY(id);
ALTER TABLE branch MODIFY location CONSTRAINT branch_location_nn NOT NULL;
ALTER TABLE branch MODIFY name CONSTRAINT branch_name_nn NOT NULL;

COMMENT ON COLUMN branch.id IS '영화관(지점) 식별번호';
COMMENT ON COLUMN branch.location IS '영화관의 지역명';
COMMENT ON COLUMN branch.name IS '영화관의 지점명';

-- 상영관 테이블
CREATE TABLE theater (
    id NUMBER,
    bid NUMBER,
    name VARCHAR2(128)
);

ALTER TABLE theater ADD CONSTRAINT theater_id_pk PRIMARY KEY(id);
ALTER TABLE theater ADD CONSTRAINT theater_bid_FK FOREIGN KEY(bid) REFERENCES branch(id);
ALTER TABLE theater MODIFY name CONSTRAINT theater_name_nn NOT NULL;

COMMENT ON COLUMN theater.id IS '상영관의 식별번호';
COMMENT ON COLUMN theater.bid IS '상영관의 지점 식별번호';
COMMENT ON COLUMN theater.name IS '상영관의 이름';

-- 영화 상영관 테이블
CREATE TABLE movie_theater (
   id NUMBER,
   mid NUMBER,
   tid NUMBER,
   enddate date
);

ALTER TABLE movie_theater ADD CONSTRAINT movie_t_id_pk PRIMARY KEY(id);
ALTER TABLE movie_theater ADD CONSTRAINT movie_t_mid_FK FOREIGN KEY(mid) REFERENCES movie(id);
ALTER TABLE movie_theater ADD CONSTRAINT movie_t_tid_FK FOREIGN KEY(tid) REFERENCES theater(id);

COMMENT ON COLUMN movie_theater.id IS '영화의 상영관 식별번호';
COMMENT ON COLUMN movie_theater.mid IS '영화의 식별번호';
COMMENT ON COLUMN movie_theater.tid IS '상영관 식별번호';
COMMENT ON COLUMN movie_theater.enddate IS '영화 상영 종료일';

--영화 이미지
CREATE TABLE Image_files(
	id		NUMBER,
	mid		NUMBER,
	name	NVARCHAR2(512),
	path	NVARCHAR2(1024)
);

ALTER TABLE Image_files ADD CONSTRAINT Image_files_id_PK PRIMARY KEY(id);
ALTER TABLE Image_files ADD CONSTRAINT Image_files_mid_FK FOREIGN KEY(mid) REFERENCES movie(id);
ALTER TABLE Image_files MODIFY name CONSTRAINT Image_files_name_NN NOT NULL;
ALTER TABLE Image_files MODIFY path CONSTRAINT Image_files_path_NN NOT NULL;

COMMENT ON COLUMN Image_files.id IS '영화 이미지 식별 번호';
COMMENT ON COLUMN Image_files.mid IS '어떤 영화의 첨부 파일인지 식별하기 위한 영화 식별 번호';
COMMENT ON COLUMN Image_files.name IS '이미지 첨부파일의 파일명';
COMMENT ON COLUMN Image_files.path IS '이미지의 실제 저장 경로(위치)';

-- 영화 시간 테이블
CREATE TABLE time (
   id NUMBER,
   mtid NUMBER,
   moviedate date,
   starttime VARCHAR2(20),
   endtime VARCHAR2(20)
);

ALTER TABLE time ADD CONSTRAINT time_id_pk PRIMARY KEY(id);
ALTER TABLE time ADD CONSTRAINT time_mtid_FK FOREIGN KEY(mtid) REFERENCES movie_theater(id);
ALTER TABLE time MODIFY moviedate CONSTRAINT time_moviedate_nn NOT NULL;
ALTER TABLE time MODIFY starttime CONSTRAINT time_starttime_nn NOT NULL;
ALTER TABLE time MODIFY endtime CONSTRAINT time_endtime_nn NOT NULL;

COMMENT ON COLUMN time.id IS '영화의 시간 식별번호';
COMMENT ON COLUMN time.mtid IS '영화의 상영관 식별번호';
COMMENT ON COLUMN time.moviedate IS '영화의 상영일';
COMMENT ON COLUMN time.starttime IS '영화의 상영 시작시간';
COMMENT ON COLUMN time.endtime IS '영화의 상영 종료시간';

-- 좌석 테이블
CREATE TABLE seat(
    id NUMBER,
    tid NUMBER,
    seatrow CHAR(1),
    seatcol NUMBER,
    reserved CHAR(1)
);

ALTER TABLE seat ADD CONSTRAINT seat_id_pk PRIMARY KEY(id);
ALTER TABLE seat ADD CONSTRAINT seat_tid_FK FOREIGN KEY(tid) REFERENCES time(id);
ALTER TABLE seat MODIFY seatrow CONSTRAINT seat_row_nn NOT NULL;
ALTER TABLE seat MODIFY seatcol CONSTRAINT seat_col_nn NOT NULL;
ALTER TABLE seat ADD CONSTRAINT seat_reserved_CK CHECK(reserved IN('n', 'y'));

COMMENT ON COLUMN seat.id IS '좌석 식별번호';
COMMENT ON COLUMN seat.tid IS '시간 식별번호';
COMMENT ON COLUMN seat.seatrow IS '좌석의 행';
COMMENT ON COLUMN seat.seatcol IS '좌석의 열';
COMMENT ON COLUMN seat.reserved IS '좌석 예약 여부';


-- 회원 테이블
CREATE TABLE account (
    id NUMBER,
    username VARCHAR2(64),
    nickname VARCHAR2(64),
    email VARCHAR2(128),
    phone VARCHAR2(64),
    password VARCHAR2(64),
    gender CHAR(1),
    age NUMBER,
    joindate DATE DEFAULT SYSDATE,
    logindate DATE DEFAULT SYSDATE,
    expiredate DATE DEFAULT NULL
);

ALTER TABLE account ADD CONSTRAINT account_id_pk PRIMARY KEY(id);
ALTER TABLE account MODIFY username CONSTRAINT account_username_nn NOT NULL;
ALTER TABLE account MODIFY nickname CONSTRAINT account_nickname_nn NOT NULL;
ALTER TABLE account MODIFY email CONSTRAINT account_email_nn NOT NULL;
ALTER TABLE account MODIFY phone CONSTRAINT account_phone_nn NOT NULL;
ALTER TABLE account MODIFY password CONSTRAINT account_password_nn NOT NULL;
ALTER TABLE account ADD CONSTRAINT account_gender_CK CHECK(gender IN('M', 'F'));
ALTER TABLE account MODIFY age CONSTRAINT account_age_nn NOT NULL;

COMMENT ON COLUMN account.id IS '회원 식별번호';
COMMENT ON COLUMN account.username IS '회원 이름';
COMMENT ON COLUMN account.nickname IS '회원 닉네임';
COMMENT ON COLUMN account.email IS '회원 이메일';
COMMENT ON COLUMN account.phone IS '회원 연락처';
COMMENT ON COLUMN account.password IS '회원 비밀번호';
COMMENT ON COLUMN account.gender IS '회원 성별';
COMMENT ON COLUMN account.age IS '회원 나이';
COMMENT ON COLUMN account.joindate IS '회원 가입일';
COMMENT ON COLUMN account.logindate IS '회원 로그인일';
COMMENT ON COLUMN account.expiredate IS '회원 탈퇴일';


-- 테이블 수정 - totalpay를 통해 총 결제 금액 저장 컬럼 생성.
-- 예매 정보에서 예매 id -> 예매번호로 변경
-- 예매 테이블
CREATE TABLE reservation(
    id NUMBER,
    orderid VARCHAR2(64), 
    sid NUMBER,
    timeid NUMBER,
    aid NUMBER,
    rdate date DEFAULT SYSDATE,
    cdate date DEFAULT NULL,
    rcnt NUMBER DEFAULT 1,
    totalpay NUMBER,
    payment CHAR(1)
);

ALTER TABLE reservation ADD CONSTRAINT reservation PRIMARY KEY(sid);
ALTER TABLE reservation MODIFY orderid CONSTRAINT reservation_orderid_nn NOT NULL;
ALTER TABLE reservation ADD CONSTRAINT reservation_sid_FK FOREIGN KEY(sid) REFERENCES seat(id);
ALTER TABLE reservation ADD CONSTRAINT reservation_timeid_FK FOREIGN KEY(timeid) REFERENCES time(id);
ALTER TABLE reservation ADD CONSTRAINT reservation_aid_FK FOREIGN KEY(aid) REFERENCES account(id);
ALTER TABLE reservation MODIFY totalpay CONSTRAINT reservation_totalpay_nn NOT NULL;

COMMENT ON COLUMN reservation.id IS '예매 식별번호';
COMMENT ON COLUMN reservation.orderid IS '예매 번호';
COMMENT ON COLUMN reservation.sid IS '예매 좌석 식별번호';
COMMENT ON COLUMN reservation.timeid IS '예매 시간 식별번호';
COMMENT ON COLUMN reservation.aid IS '예매자 식별번호';
COMMENT ON COLUMN reservation.rdate IS '예매 일시';
COMMENT ON COLUMN reservation.cdate IS '취소 일시';
COMMENT ON COLUMN reservation.rcnt IS '예매 인원';
COMMENT ON COLUMN reservation.totalpay IS '결제 금액';
COMMENT ON COLUMN reservation.payment IS '결제 방법';


-- 회원 구분 테이블
CREATE TABLE account_type (
    id NUMBER,
    name VARCHAR2(64)
);

ALTER TABLE account_type ADD CONSTRAINT account_t_id_pk PRIMARY KEY(id);

COMMENT ON COLUMN account_type.id IS '회원 구분 식별번호';
COMMENT ON COLUMN account_type.name IS '회원 구분명';


-- 게시판 구분 테이블
CREATE TABLE board_type (
    id NUMBER,
    name VARCHAR2(256)
);

ALTER TABLE board_type ADD CONSTRAINT board_t_id_pk PRIMARY KEY(id);

COMMENT ON COLUMN board_type.id IS '게시판 구분 식별번호';
COMMENT ON COLUMN board_type.name IS '게시판 구분명';


-- 게시판 테이블
CREATE TABLE board (
    id NUMBER,
    btype NUMBER,
    mid NUMBER,
    aid NUMBER,
    title NVARCHAR2(256),
    contents nvarchar2(1024),
    vcnt NUMBER DEFAULT 0,
    gcnt NUMBER DEFAULT 0,
    bcnt NUMBER DEFAULT 0,
    star NUMBER DEFAULT 1,
    cdate DATE DEFAULT SYSDATE,
    udate DATE DEFAULT SYSDATE,
    nodel CHAR(1) DEFAULT 'N',
    deleted CHAR(1) DEFAULT 'N'
);

ALTER TABLE board ADD CONSTRAINT board_id_pk PRIMARY KEY(id);
ALTER TABLE board ADD CONSTRAINT board_btype_FK FOREIGN KEY(btype) REFERENCES board_type(id);
ALTER TABLE board ADD CONSTRAINT board_mid_FK FOREIGN KEY(mid) REFERENCES movie(id);
ALTER TABLE board ADD CONSTRAINT board_aid_FK FOREIGN KEY(aid) REFERENCES account(id);

COMMENT ON COLUMN board.id IS '게시판 식별번호';
COMMENT ON COLUMN board.btype IS '게시판 구분 번호';
COMMENT ON COLUMN board.mid IS '게시판 영화 구분 번호';
COMMENT ON COLUMN board.aid IS '게시판 작성자명';
COMMENT ON COLUMN board.title IS '게시판 제목';
COMMENT ON COLUMN board.contents IS '게시판 내용(post의 mergeid)';
COMMENT ON COLUMN board.vcnt IS '게시판 조회수';
COMMENT ON COLUMN board.gcnt IS '게시판 추천';
COMMENT ON COLUMN board.bcnt IS '게시판 비추천';
COMMENT ON COLUMN board.star IS '게시판 별점';
COMMENT ON COLUMN board.cdate IS '게시판 작성일';
COMMENT ON COLUMN board.udate IS '게시판 수정일';
COMMENT ON COLUMN board.nodel IS '게시판 삭제금지';
COMMENT ON COLUMN board.deleted IS '게시판 삭제 구분';


-- 첨부파일 테이블
CREATE TABLE attach_files (
    id NUMBER,
    bid NUMBER,
    mid NUMBER,
    name NVARCHAR2(512),
    path NVARCHAR2(1024),
    url NVARCHAR2(1024)
);

ALTER TABLE attach_files ADD CONSTRAINT attach_files_id_pk PRIMARY KEY(id);
ALTER TABLE attach_files ADD CONSTRAINT attach_files_bid_FK FOREIGN KEY(bid) REFERENCES board(id);
ALTER TABLE attach_files ADD CONSTRAINT attach_files_mid_FK FOREIGN KEY(mid) REFERENCES movie(id);

COMMENT ON COLUMN attach_files.id IS '첨부파일 식별번호';
COMMENT ON COLUMN attach_files.bid IS '게시글 첨부파일 식별';
COMMENT ON COLUMN attach_files.mid IS '영화글 첨부파일 식별';
COMMENT ON COLUMN attach_files.name IS '첨부파일명';
COMMENT ON COLUMN attach_files.path IS '첨부파일 실 저장 경로';
COMMENT ON COLUMN attach_files.url IS '첨부파일 접근URL 경로';


-- 댓글 테이블
CREATE TABLE comments (
    id NUMBER,
    bid NUMBER,
    mid NUMBER,
    aid NUMBER,
    contents NVARCHAR2(1024),
    gcnt NUMBER DEFAULT 0,
    bcnt NUMBER DEFAULT 0,
    star NUMBER DEFAULT 1,
    cdate DATE DEFAULT SYSDATE,
    udate DATE DEFAULT SYSDATE,
    deleted CHAR(1) DEFAULT 'N',
    block CHAR(1) DEFAULT 'N'
);

ALTER TABLE comments ADD CONSTRAINT comments_id_pk PRIMARY KEY(id);
ALTER TABLE comments ADD CONSTRAINT comments_bid_FK FOREIGN KEY(bid) REFERENCES board(id);
ALTER TABLE comments ADD CONSTRAINT comments_mid_FK FOREIGN KEY(mid) REFERENCES movie(id);
ALTER TABLE comments ADD CONSTRAINT comments_aid_FK FOREIGN KEY(aid) REFERENCES account(id);

COMMENT ON COLUMN comments.id IS '댓글 식별번호';
COMMENT ON COLUMN comments.bid IS '게시글 댓글 식별';
COMMENT ON COLUMN comments.mid IS '영화 댓글 식별';
COMMENT ON COLUMN comments.aid IS '댓글 작성자 식별';
COMMENT ON COLUMN comments.contents IS '댓글 내용';
COMMENT ON COLUMN comments.gcnt IS '댓글 추천';
COMMENT ON COLUMN comments.bcnt IS '댓글 비추천';
COMMENT ON COLUMN comments.star IS '댓글 별점';
COMMENT ON COLUMN comments.cdate IS '댓글 작성일';
COMMENT ON COLUMN comments.udate IS '댓글 수정일';
COMMENT ON COLUMN comments.deleted IS '댓글 삭제 구분';
COMMENT ON COLUMN comments.block IS '댓글 블록';


--좋아요 저장용
CREATE TABLE movielike (
	mid NUMBER ,
	aid NUMBER
);
alter table movielike add constraint movielike_mid_fk foreign key(mid) references movie(id);
alter table movielike add constraint movielike_aid_fk foreign key(aid) references account(id);

COMMENT ON COLUMN movielike.mid IS '영화 식별번호';
COMMENT ON COLUMN movielike.aid IS '계정 식별번호';

-- 한줄평 테이블
CREATE TABLE line (
    id NUMBER,
    mid NUMBER,
    aid NUMBER,
    contents NVARCHAR2(1024),
    gcnt NUMBER DEFAULT 0,
    star NUMBER DEFAULT 1,
    cdate DATE DEFAULT SYSDATE,
    deleted CHAR(1) DEFAULT 'N'
);

ALTER TABLE line ADD CONSTRAINT line_id_pk PRIMARY KEY(id);
ALTER TABLE line ADD CONSTRAINT line_mid_FK FOREIGN KEY(mid) REFERENCES movie(id);
ALTER TABLE line ADD CONSTRAINT line_aid_FK FOREIGN KEY(aid) REFERENCES account(id);

COMMENT ON COLUMN line.id IS '한줄평 식별번호';
COMMENT ON COLUMN line.mid IS '한줄평 대상 영화 식별';
COMMENT ON COLUMN line.aid IS '한줄평 작성자 식별';
COMMENT ON COLUMN line.contents IS '한줄평 내용';
COMMENT ON COLUMN line.gcnt IS '한줄평 추천수';
COMMENT ON COLUMN line.star IS '한줄평 별점';
COMMENT ON COLUMN line.cdate IS '한줄평 작성일';
COMMENT ON COLUMN line.deleted IS '한줄평 삭제 구분';

--회원 id 1번 테스트용
--INSERT INTO "WEBADMIN"."ACCOUNT" (ID, NAME, NICKNAME, EMAIL, PHONE, PASSWORD, GENDER, AGE) VALUES ('1', 'test', 'test', 'test', '0', 'test', 'M', '27')

-- 포스트 테이블(이 테이블의 mergePost 값들로 조회한 리스트가 review(board)테이블의 contents 값으로 들어감.)
CREATE TABLE post (
	id NUMBER,
	mergePost NUMBER,
	postimg NVARCHAR2(1024),
	posttext NVARCHAR2(1024) 
);

ALTER TABLE post ADD CONSTRAINT post_id_pk PRIMARY KEY(id);

COMMENT ON COLUMN post.id IS '포스트 식별번호';
COMMENT ON COLUMN post.mergePost IS '포스트 묶음번호';
COMMENT ON COLUMN post.postimg IS '포스트 이미지';
COMMENT ON COLUMN post.posttext IS '포스트 내용';

-- 페이 테이블
CREATE TABLE pay (
    id NUMBER,
    price NUMBER
);

ALTER TABLE pay ADD CONSTRAINT pay_id_pk PRIMARY KEY(id);
ALTER TABLE pay MODIFY price CONSTRAINT pay_price_nn NOT NULL;

COMMENT ON COLUMN pay.id IS '나이 식별번호';
COMMENT ON COLUMN pay.price IS '영화가격';

-- 회원 액션 테이블(로그인 연동처리는 시간되면 구현하기로..)
--CREATE TABLE account_action (
--	aid NUMBER,
--	reviewGcnt NUMBER,
--	reviewBcnt NUMBER,
--);