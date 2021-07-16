SELECT * FROM movie_theater;

DELETE movie_theater;
DROP SEQUENCE movie_t_seq;

CREATE SEQUENCE movie_t_seq;
--DROP SEQUENCE movie_t_seq;

-- 위왓치유(ID : 1) / 강남 1관(ID : 1)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 1, 1, TO_DATE('21/09/12','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 2, 1, TO_DATE('21/09/13','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 3, 1, TO_DATE('21/09/14','YY/MM/DD'));
-- 강남 2관 (tid : 2)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 4, 2, TO_DATE('21/09/15','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 5, 2, TO_DATE('21/09/15','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 6, 2, TO_DATE('21/09/15','YY/MM/DD'));
-- 강남대로 1관 (tid : 3)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 8, 3, TO_DATE('21/09/15','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 9, 3, TO_DATE('21/09/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 10, 3, TO_DATE('21/09/20','YY/MM/DD'));
-- 위왓치유(ID : 1) / 강남대로 2관(ID : 4)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 1, 4, TO_DATE('21/09/15','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 13, 4, TO_DATE('21/09/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 14, 4, TO_DATE('21/09/20','YY/MM/DD'));
-- 강동 1관 (tid : 5)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 17, 5, TO_DATE('21/09/15','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 18, 5, TO_DATE('21/09/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 19, 5, TO_DATE('21/09/20','YY/MM/DD'));
-- 강동 2관 (tid : 6)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 22, 6, TO_DATE('21/09/15','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 23, 6, TO_DATE('21/09/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 24, 6, TO_DATE('21/09/20','YY/MM/DD'));
-- 그 여름, 가장 차가웠던(ID : 2) / 고양스타필드 1관(ID :7)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 27, 7, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 28, 7, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 29, 7, TO_DATE('21/10/20','YY/MM/DD'));
-- 고양스타필드 2관 (tid : 8)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 2, 8, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 3, 8, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 4, 8, TO_DATE('21/10/20','YY/MM/DD'));
-- 김포한강신도시 1관 (tid : 9)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 7, 9, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 8, 9, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 9, 9, TO_DATE('21/10/20','YY/MM/DD'));
-- 그 여름, 가장 차가웠던(ID : 2) / 김포한강신도시 2관(ID :10)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 11, 10, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 13, 10, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 14, 10, TO_DATE('21/10/20','YY/MM/DD'));
-- 남양주 1관 (tid : 11)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 12, 11, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 3, 11, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 4, 11, TO_DATE('21/10/20','YY/MM/DD'));
-- 남양주 2관 (tid : 12)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 5, 12, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 6, 12, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 7, 12, TO_DATE('21/10/20','YY/MM/DD'));
-- 그레타 툰베리(ID : 3) / 검단 1관(ID :13)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 3, 13, TO_DATE('21/09/24','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 2, 13, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 6, 13, TO_DATE('21/10/18','YY/MM/DD'));
-- 검단 2관 (tid : 14)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 11, 14, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 13, 14, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 24, 14, TO_DATE('21/10/20','YY/MM/DD'));
-- 송도 1관 (tid : 15)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 22, 15, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 23, 15, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 14, 15, TO_DATE('21/10/20','YY/MM/DD'));
-- 그레타 툰베리(ID : 3) / 송도 2관(ID : 16)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 30, 16, TO_DATE('21/10/10','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 23, 16, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 13, 16, TO_DATE('21/10/18','YY/MM/DD'));
-- 영종 1관 (tid : 17)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 12, 17, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 3, 17, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 24, 17, TO_DATE('21/10/20','YY/MM/DD'));
-- 영종 2관 (tid : 18)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 10, 18, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 30, 18, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 4, 18, TO_DATE('21/10/20','YY/MM/DD'));
-- 위왓치유(ID : 1) / 공주 1관(ID : 19)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 11, 19, TO_DATE('21/09/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 13, 19, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 15, 19, TO_DATE('21/10/18','YY/MM/DD'));
-- 공주 2관 (tid : 20)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 17, 20, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 16, 20, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 18, 20, TO_DATE('21/10/20','YY/MM/DD'));
-- 논산 1관 (tid : 21)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 29, 21, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 28, 21, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 25, 21, TO_DATE('21/10/20','YY/MM/DD'));
-- 위왓치유(ID : 1) / 논산 2관(ID : 22)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 1, 22, TO_DATE('21/09/12','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 2, 22, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 3, 22, TO_DATE('21/10/18','YY/MM/DD'));
-- 대전 1관 (tid : 23)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 4, 23, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 5, 23, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 6, 23, TO_DATE('21/10/20','YY/MM/DD'));
-- 대전 2관 (tid : 24)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 6, 24, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 8, 24, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 9, 24, TO_DATE('21/10/20','YY/MM/DD'));
-- 그 여름, 가장 차가웠던(ID : 2) / 경북도청 1관(ID :25)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 11, 25, TO_DATE('21/10/01','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 22, 25, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 30, 25, TO_DATE('21/10/18','YY/MM/DD'));
-- 경북도청 2관 (tid : 26)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 12, 26, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 13, 26, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 14, 26, TO_DATE('21/10/20','YY/MM/DD'));
-- 경산하양 1관 (tid : 27)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 15, 27, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 16, 27, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 17, 27, TO_DATE('21/10/20','YY/MM/DD'));
-- 그 여름, 가장 차가웠던(ID : 2) / 경산하양 2관(ID :28)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 19, 28, TO_DATE('21/09/20','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 20, 28, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 4, 28, TO_DATE('21/10/18','YY/MM/DD'));
-- 구미강동 1관 (tid : 29)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 5, 29, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 6, 29, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 7, 29, TO_DATE('21/10/20','YY/MM/DD'));
-- 구미강동 2관 (tid : 30)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 7, 30, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 8, 30, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 9, 30, TO_DATE('21/10/20','YY/MM/DD'));
-- 그레타 툰베리(ID : 3) / 광주상무 1관(ID :31)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 10, 31, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 20, 31, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 21, 31, TO_DATE('21/10/20','YY/MM/DD'));
-- 광주상무 2관 (tid : 32)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 22, 32, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 30, 32, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 6, 32, TO_DATE('21/10/20','YY/MM/DD'));
-- 광주하남 1관 (tid : 33)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 7, 33, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 8, 33, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 9, 33, TO_DATE('21/10/20','YY/MM/DD'));
-- 그레타 툰베리(ID : 3) / 광주하남 2관(ID : 34)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 10, 34, TO_DATE('21/10/21','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 19, 34, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 18, 34, TO_DATE('21/10/18','YY/MM/DD'));
-- 목포하당 1관 (tid : 35)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 7, 35, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 13, 35, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 14, 35, TO_DATE('21/10/20','YY/MM/DD'));
-- 목포하당 2관 (tid : 36)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 21, 36, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 23, 36, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 24, 36, TO_DATE('21/10/20','YY/MM/DD'));
-- 남춘천 1관 (tid : 37)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 1, 37, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 3, 37, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 5, 37, TO_DATE('21/10/20','YY/MM/DD'));
-- 남춘천 2관 (tid : 38)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 7, 38, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 9, 38, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 11, 38, TO_DATE('21/10/20','YY/MM/DD'));
-- 속초 1관 (tid : 39)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 13, 39, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 15, 39, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 17, 39, TO_DATE('21/10/20','YY/MM/DD'));
-- 속초 2관 (tid : 40)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 19, 40, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 21, 40, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 23, 40, TO_DATE('21/10/20','YY/MM/DD'));
-- 원주 1관 (tid : 41)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 24, 41, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 26, 41, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 28, 41, TO_DATE('21/10/20','YY/MM/DD'));
-- 원주 2관 (tid : 42)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 29, 42, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 30, 42, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 2, 42, TO_DATE('21/10/20','YY/MM/DD'));

-- 지역->지점 선택 후 상영중인 영화리스트 출력
-- 중복된 영화 제거 후 리스트 뽑기..
-- (theater = 지점별 상영관 테이블, movie_theater = 영화 상영관, movie = 영화)
SELECT distinct
	a.mid,
	--a.tid,
	--a.enddate,
	b.id,
	b.rating,
	b.title,
	--c.name,
	c.bid,
	d.location,
	d.name
FROM movie_theater a
JOIN movie b
ON a.mid = b.id
JOIN theater c
ON a.tid = c.id
JOIN branch d
ON c.bid = d.id
WHERE d.location = '서울' AND d.name = '강남';

-- 날짜 선택 ...해당 날짜 클릭시
-- 선택한 영화에 대한 관(1,2관)과 영화시작시간/영화종료시간, 총좌석수, 남은좌석수 리스트 출력
-- movie, movie_theater, time
SELECT t.mtid,
	t.moviedate,
	t.starttime,
	t.endtime,
	mt.id,
	mt.tid,
	mt.mid,
	t.bid,
	t.name
FROM time t
JOIN movie_theater mt
ON t.mtid = mt.id
JOIN theater t
ON mt.tid = t.id
WHERE mt.tid = '1' AND mt.mid = '1';

SELECT * FROM branch;
SELECT * FROM theater;
SELECT * FROM movie_theater;
SELECT * FROM time;
SELECT * FROM seat;
SELECT * FROM movie;

COMMIT;