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

DROP SEQUENCE merge_seq;
DROP SEQUENCE post_seq;
CREATE SEQUENCE post_seq;
CREATE SEQUENCE merge_seq;

SELECT * FROM post;
DELETE FROM post WHERE id  <= 200;
SELECT mergePost FROM post WHERE id <= 30;

merge_seq.CURRVAL;



DROP TABLE post;