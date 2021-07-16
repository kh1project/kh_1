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