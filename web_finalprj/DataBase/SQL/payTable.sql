CREATE TABLE pay (
    id NUMBER,
    price NUMBER
);

ALTER TABLE pay ADD CONSTRAINT pay_id_pk PRIMARY KEY(id);
ALTER TABLE pay MODIFY price CONSTRAINT pay_price_nn NOT NULL;

COMMENT ON COLUMN pay.id IS '나이 식별번호';
COMMENT ON COLUMN pay.price IS '영화가격';

CREATE SEQUENCE pay_seq;

INSERT INTO pay(id, price) VALUES(pay_seq.NEXTVAL, 10000);
INSERT INTO pay(id, price) VALUES(pay_seq.NEXTVAL, 13000);

SELECT * FROM pay;