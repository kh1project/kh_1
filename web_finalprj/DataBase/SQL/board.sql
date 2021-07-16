DROP TABLE board;
DROP TABLE board_type;

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
    contents NVARCHAR2(1024),
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
ALTER TABLE board ADD CONSTRAINT board_aid_FK FOREIGN KEY(aid) REFERENCES account(id);
-- NCLOB으로 들어갈 필요가 없어짐.
ALTER TABLE board DROP (contents);
ALTER TABLE board ADD contents NVARCHAR2(1024);
ALTER TABLE board ADD mid NUMBER;

select * from ALL_TAB_COLUMNS where TABLE_NAME = 'board' ;
select * from board;

COMMENT ON COLUMN board.id IS '게시판 식별번호';
COMMENT ON COLUMN board.btype IS '게시판 타입 구분 번호';
COMMENT ON COLUMN board.mid IS '게시판 영화 구분 번호';
COMMENT ON COLUMN board.aid IS '게시판 작성자명';
COMMENT ON COLUMN board.title IS '게시판 제목';
COMMENT ON COLUMN board.contents IS '게시판 내용';
COMMENT ON COLUMN board.vcnt IS '게시판 조회수';
COMMENT ON COLUMN board.gcnt IS '게시판 추천';
COMMENT ON COLUMN board.bcnt IS '게시판 비추천';
COMMENT ON COLUMN board.star IS '게시판 별점';
COMMENT ON COLUMN board.cdate IS '게시판 작성일';
COMMENT ON COLUMN board.udate IS '게시판 수정일';
COMMENT ON COLUMN board.nodel IS '게시판 삭제금지';
COMMENT ON COLUMN board.deleted IS '게시판 삭제 구분';

------------------------------------------------ 초기 INSERT 문
CREATE SEQUENCE board_type_seq;
INSERT INTO board_type(id, name) VALUES (board_type_seq.NEXTVAL, '영화리뷰');

CREATE SEQUENCE board_seq;
------------------------------------------------
select id,title from movie where id = 1;
SELECT * FROM board WHERE btype = 1 ORDER BY (gcnt - bcnt) DESC;

-- 내가본 영화 쿼리 테스트
SELECT * FROM board WHERE btype = 1 AND deleted = 'N' AND nodel = 'N' AND mid IN (
		SELECT a.mid FROM board a
		  LEFT OUTER JOIN account b ON a.aid = b.id
		  LEFT OUTER JOIN movie_theater c ON a.mid = c.mid
		  LEFT OUTER JOIN time d ON c.tid = d.id
		  LEFT OUTER JOIN reservation e ON d.id = e.timeid
		 WHERE b.id = 1
      GROUP BY a.mid) ORDER BY id DESC;
 

DROP SEQUENCE board_seq;
DELETE FROM board WHERE id  <= 100;
CREATE SEQUENCE board_seq;

-- 좋아요 확인
UPDATE board SET gcnt = 1 WHERE id = 1;

-- MyMovieDTO select문
select a.id, a.title, b.path, b.name
  from movie a, Image_files b
 where a.id = b.mid and a.id = 1;