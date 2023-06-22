use dbkoperasi;


CREATE TABLE t(
    c1 INT PRIMARY KEY,
    c2 INT NOT NULL,
    c3 INT NOT NULL,
    c4 VARCHAR(10),
    INDEX (c1, c2)
);


CREATE INDEX idx_c4 ON t(c4);

EXPLAIN SELECT * FROM produk;

SELECT * FROM produk;

CREATE INDEX tmpLahir ON pelanggan(tmp_lahir);

SELECT kode, nama, tmp_lahir FROM pelanggan WHERE tmp_lahir="Surabaya";

EXPLAIN SELECT kode, nama, tmp_lahir FROM pelanggan WHERE tmp_lahir="Surabaya";

DROP INDEX tmpLahir ON pelanggan;

/*
* Distinct :=> dimana select data yang tidak sama / unique
*/
SELECT DISTINCT * FROM pelanggan;


SHOW INDEXES FROM t;
