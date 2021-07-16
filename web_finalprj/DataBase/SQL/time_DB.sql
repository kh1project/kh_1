SELECT * FROM time;
DELETE time WHERE id <= 60;
CREATE SEQUENCE time_seq;
-- DROP SEQUENCE time_seq;

-- 날짜마다 시작~종료 시간 넣어줘야 하는 듯
-- 강남 1관, 위왓치유, 시간표
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 1, TO_DATE('21/07/16', 'YY/MM/DD'), '11:30:00', '13:14:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 1, TO_DATE('21/07/16', 'YY/MM/DD'), '13:34:00', '15:18:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 1, TO_DATE('21/07/16', 'YY/MM/DD'), '17:40:00', '19:10:00');

-- 강남 1관, 그 여름, 가장 차가웠던, 시간표
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 2, TO_DATE('21/07/16', 'YY/MM/DD'), '11:40:00', '13:24:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 2, TO_DATE('21/07/16', 'YY/MM/DD'), '13:44:00', '15:28:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 2, TO_DATE('21/07/16', 'YY/MM/DD'), '17:40:00', '19:10:00');

-- 강남 1관, 그레타 툰베리, 시간표
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 3, TO_DATE('21/07/16', 'YY/MM/DD'), '11:20:00', '13:04:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 3, TO_DATE('21/07/16', 'YY/MM/DD'), '13:04:00', '15:08:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 3, TO_DATE('21/07/16', 'YY/MM/DD'), '17:40:00', '19:10:00');

-- 강남 2관, 귀멸의 칼날, 시간표
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 4, TO_DATE('21/07/16', 'YY/MM/DD'), '11:30:00', '13:14:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 4, TO_DATE('21/07/16', 'YY/MM/DD'), '13:34:00', '15:18:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 4, TO_DATE('21/07/16', 'YY/MM/DD'), '17:40:00', '19:10:00');

-- 강남 2관, 까지발, 시간표
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 5, TO_DATE('21/07/16', 'YY/MM/DD'), '11:30:00', '13:14:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 5, TO_DATE('21/07/16', 'YY/MM/DD'), '13:34:00', '15:18:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 5, TO_DATE('21/07/16', 'YY/MM/DD'), '17:40:00', '19:10:00');

-- 강남 2관, 낫아웃, 시간표
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 6, TO_DATE('21/07/16', 'YY/MM/DD'), '11:30:00', '13:14:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 6, TO_DATE('21/07/16', 'YY/MM/DD'), '13:34:00', '15:18:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 6, TO_DATE('21/07/16', 'YY/MM/DD'), '17:40:00', '19:10:00');

-- time.jsp 참고용 select문
SELECT
    m.id,
    m.playdate,
    th.bid,
    th.name,
    mt.mid,
    mt.tid,
    mt.enddate,
    t.starttime,
    t.endtime,
	(SELECT count(*) FROM seat s WHERE s.tid = th.id) as seat_count,
	(SELECT count(*) FROM seat s WHERE s.reserved = 'y') as seat_reserved
FROM time t
JOIN movie_theater mt
ON t.mtid = mt.id
JOIN movie m
ON mt.mid = m.id
JOIN theater th
ON mt.tid = th.id
JOIN branch b
ON th.bid = b.id
WHERE b.location = '서울' AND b.name = '강남'
	AND m.rating = '19' AND m.title = '#위왓치유' AND TO_CHAR(t.moviedate, 'yyyy-mm-dd') = '2021-07-10';
	
SELECT *
  FROM seat s
  JOIN time t
    ON t.id = s.tid
 WHERE t.mtid = 1
 ORDER BY id