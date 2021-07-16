DROP TABLE branch;
DROP TABLE theater;
DROP TABLE time;
DROP TABLE movie_theater;
DROP TABLE reservation;
DROP TABLE seat;
DROP TABLE movie;


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

-- 지점별 상영관 테이블
-- a지점에 1/2관
-- b지점에 1/2관
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

-- 영화 상영관 테이블
-- 특정 영화관(1/2관)에서 상영하는 영화
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

-- 예매 테이블
CREATE TABLE reservation(
    id NUMBER,
    sid NUMBER,
    timeid NUMBER,
    aid NUMBER,
    rdate date DEFAULT SYSDATE,
    cdate date DEFAULT NULL,
    rcnt NUMBER DEFAULT 1,
    payment CHAR(1)
);

-- 컬럼명 오타 확인
ALTER TABLE movie RENAME COLUMN reating TO rating;

ALTER TABLE reservation ADD CONSTRAINT reservation PRIMARY KEY(id);
ALTER TABLE reservation ADD CONSTRAINT reservation_sid_FK FOREIGN KEY(sid) REFERENCES seat(id);
ALTER TABLE reservation ADD CONSTRAINT reservation_timeid_FK FOREIGN KEY(timeid) REFERENCES time(id);
ALTER TABLE reservation ADD CONSTRAINT reservation_aid_FK FOREIGN KEY(aid) REFERENCES account(id);

COMMENT ON COLUMN reservation.id IS '예매 식별번호';
COMMENT ON COLUMN reservation.sid IS '예매 좌석 식별번호';
COMMENT ON COLUMN reservation.timeid IS '예매 시간 식별번호';
COMMENT ON COLUMN reservation.aid IS '예매자 식별번호';
COMMENT ON COLUMN reservation.rdate IS '예매 일시';
COMMENT ON COLUMN reservation.cdate IS '취소 일시';
COMMENT ON COLUMN reservation.rcnt IS '예매 인원';
COMMENT ON COLUMN reservation.payment IS '결제 방법';

-- 좌석 테이블
CREATE TABLE seat(
    id NUMBER,
    tid NUMBER,
    seatrow CHAR(1),
    seatcol NUMBER,
    reserved CHAR(1)
);

ALTER TABLE seat ADD CONSTRAINT seat_id_pk PRIMARY KEY(id);
ALTER TABLE seat MODIFY seatrow CONSTRAINT seat_row_nn NOT NULL;
ALTER TABLE seat MODIFY seatcol CONSTRAINT seat_col_nn NOT NULL;
ALTER TABLE seat ADD CONSTRAINT seat_reserved_CK CHECK(reserved IN('n', 'y'));

COMMENT ON COLUMN seat.id IS '좌석 식별번호';
COMMENT ON COLUMN seat.tid IS '상영관 식별번호';
COMMENT ON COLUMN seat.seatrow IS '좌석의 행';
COMMENT ON COLUMN seat.seatcol IS '좌석의 열';
COMMENT ON COLUMN seat.reserved IS '좌석 예약 여부';

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

commit;