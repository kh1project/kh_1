SELECT * FROM theater;
SELECT * FROM branch;
--SELECT * FROM branch WHERE location = '서울';

-- 지점의 상영관 조회
SELECT branch.location,
       branch.name,
       theater.id,
       theater.bid,
       theater.name
FROM  branch
INNER JOIN theater
ON branch.id = theater.bid;

DROP SEQUENCE theater_seq;
CREATE SEQUENCE theater_seq;
--DROP SEQUENCE theater_seq;

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 1, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 1, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 2, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 2, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 3, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 3, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 4, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 4, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 5, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 5, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 6, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 6, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 7, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 7, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 8, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 8, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 9, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 9, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 10, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 10, '2관');


INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 11, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 11, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 12, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 12, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 13, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 13, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 14, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 14, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 15, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 15, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 16, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 16, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 17, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 17, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 18, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 18, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 19, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 19, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 20, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 20, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 21, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 21, '2관');