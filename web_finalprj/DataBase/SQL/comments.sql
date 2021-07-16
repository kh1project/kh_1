DROP TABLE comments;

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
