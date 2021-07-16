SELECT * FROM branch;
DROP SEQUENCE branch_seq;

--DELETE FROM branch WHERE id = 1;

-- SELECT * FROM branch WHERE location = '서울' ORDER BY name;

CREATE SEQUENCE branch_seq;
--DROP SEQUENCE branch_seq;

-- 서울 지점.
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '서울', '강남');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '서울', '강남대로(씨티)');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '서울', '강동');

-- 경기 지점.
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '경기', '고양스타필드');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '경기', '김포한강신도시');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '경기', '남양주');

-- 인천지점
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '인천', '검단');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '인천', '송도');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '인천', '영종');

-- 대전/충청/세종
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '대전/충청/세종', '공주');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '대전/충청/세종', '논산');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '대전/충청/세종', '대전');

-- 부산/대구/경상
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '부산/대구/경상', '경북도청');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '부산/대구/경상', '경산하양');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '부산/대구/경상', '구미강동');

-- 광주/전라
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '광주/전라', '광주상무');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '광주/전라', '광주하남');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '광주/전라', '목포하당');

-- 강원
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '강원', '남춘천');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '강원', '속초');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '강원', '원주');


-- SELECT distinct location FROM branch;