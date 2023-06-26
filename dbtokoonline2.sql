CREATE DATABASE dbtokoonline2;

USE dbtokoonline2;


CREATE TABLE jenis (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nama varchar(45) NOT NULL
);

CREATE TABLE pelanggan (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nama varchar(45) NOT NULL,
  alamat text NOT NULL,
  hp varchar(15) NOT NULL,
  email varchar(45) NOT NULL,
  foto varchar(45) DEFAULT NULL
);

CREATE TABLE produk (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  kode char(5) NOT NULL,
  nama varchar(45) NOT NULL,
  harga double NOT NULL,
  stok int(11) NOT NULL,
  foto varchar(45) DEFAULT NULL,
  jenis_id int(11) NOT NULL,
  FOREIGN KEY (jenis_id) REFERENCES jenis(id)
);


CREATE TABLE pesanan (
    id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    kode char(5) NOT NULL,
    tgl date NOT NULL DEFAULT current_timestamp(),
    produk_id int(11) NOT NULL,
    pelanggan_id int(11) NOT NULL,
    jumlah int(11) NOT NULL,
    keterangan text DEFAULT NULL,
    FOREIGN KEY (produk_id) REFERENCES produk(id),
    FOREIGN KEY (pelanggan_id) REFERENCES pelanggan(id)
);

CREATE TABLE retur (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  kode char(5) NOT NULL,
  pesanan_id int(11) NOT NULL,
  keterangan text DEFAULT NULL,
  FOREIGN KEY (pesanan_id) REFERENCES pesanan(id)
);


CREATE TABLE suplier (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nama varchar(45) NOT NULL,
  alamat text NOT NULL,
  hp varchar(15) NOT NULL,
  email varchar(45) NOT NULL
);


INSERT INTO jenis (nama) VALUES ('Elektronik'),('Furniture'),('Souvenir');

INSERT INTO produk (kode,nama,harga,stok,jenis_id) VALUES
('tv001','TV 32 inchi',5000000,4,1),('ac001','AC',7000000,2,1),
('mj001','Meja Belajar',2000000,6,2),('mj002','Meja Makan',4000000,3,2);

INSERT INTO pelanggan (nama,alamat,hp,email) VALUES
('Budi Santoso','Bekasi Barat','0857654321','budi@gmail.com'),
('Siti Aminah','Jakarta Barat','0812654321','siti@gmail.com');

INSERT INTO pesanan (kode,tgl,produk_id,pelanggan_id,jumlah) VALUES
('P0001',now(),3,1,1),
('P0002',now(),1,2,3);


-- join table
SELECT produk.*, jenis.nama AS kategori
FROM produk INNER JOIN jenis
ON jenis.id = produk.jenis_id;

SELECT produk.*, jenis.nama AS kategori
FROM produk RIGHT JOIN jenis
ON jenis.id = produk.jenis_id;

SELECT pelanggan.nama, pesanan.kode, pesanan.tgl, produk.nama AS barang,
jenis.nama AS kategori,pesanan.jumlah FROM pesanan
INNER JOIN produk ON produk.id = pesanan.produk_id
INNER JOIN pelanggan ON pelanggan.id = pesanan.pelanggan_id
INNER JOIN jenis ON jenis.id = produk.jenis_id;

-- mengaliaskan nama tabel
SELECT c.nama, o.kode, o.tgl, p.nama AS barang,
j.nama AS kategori,o.jumlah FROM pesanan o
INNER JOIN produk p ON p.id = o.produk_id
INNER JOIN pelanggan c ON c.id = o.pelanggan_id
INNER JOIN jenis j ON j.id = p.jenis_id;