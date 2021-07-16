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

-- line_DB
CREATE SEQUENCE line_seq;