USE dbkoperasi1;

-- Procedure getAllProducts() -> produk & jenis_produk
DELIMITER //
-- Statement create procedure name
CREATE PROCEDURE getAllProducts()
BEGIN
    -- logical SQL
    SELECT produk.*, jenis_produk.nama
    FROM produk
    INNER JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id;
END //
DELIMITER ;

CALL getAllProducts();


-- Procedure with params getProductById(params: id_product) -> produk & jenis_produk
DELIMITER //
-- Statement create procedure name with params id
CREATE PROCEDURE getProductById(IN id_product INT)
BEGIN
    SELECT produk.*, jenis_produk.nama as jenis_produk
    FROM produk
        INNER JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id
    WHERE produk.id = id_product;
END //
DELIMITER ;

CALL getProductById(3);

SHOW TABLES;

SELECT * FROM pelanggan;
DESC pelanggan;

-- Procedure input with params (pelanggan)
DELIMITER //
CREATE PROCEDURE inputPelanggan(
    IN kodePel varchar(10),
    IN namaPel varchar(45),
    IN gender char(1),
    IN tempatLahir varchar(30),
    IN tanggalLahir date,
    IN emailPel varchar(45),
    IN idKartu int(11)
)
BEGIN
    INSERT INTO pelanggan(id, kode, nama, jk, tmp_lahir, tgl_lahir, email, kartu_id)
    VALUES (default, kodePel, namaPel, gender, tempatLahir, tanggalLahir, emailPel, idKartu);
END //
DELIMITER ;

CALL inputPelanggan("C012", "Billy", "L", "Bogor", "2003-10-05", "billy@mail.com", 2);
CALL inputPelanggan("C013", "Mu'adz", "L", "Pontianak", "2001-10-05", "mu'adz@mail.com", 3);

SELECT * FROM pelanggan;