USE dbkoperasi;

-- Buat function getCustomerById
DELIMITER $$
CREATE PROCEDURE getCustomerById(IN id_pel int)
BEGIN
    SELECT * FROM pelanggan WHERE id = id_pel;
END $$
DELIMITER ;

CALL getCustomerById(3);
CALL getCustomerById(10);


-- Buat function getAllProduct
DELIMITER //
CREATE PROCEDURE getAllProduct()
BEGIN
    SELECT produk.*, jp.nama as Nama_Produk FROM produk
    INNER JOIN jenis_produk jp on produk.jenis_produk_id = jp.id;
END //
DELIMITER ;

CALL getAllProduct();


DELIMITER //
CREATE PROCEDURE getCustomerByGender(IN gender char(1))
BEGIN
    SELECT * FROM pelanggan WHERE jk = gender;
END //
DELIMITER ;

CALL getCustomerByGender("L");



DELIMITER //
CREATE PROCEDURE getProductPurchesed(IN id_prod INT, OUT total INT)
BEGIN
    SELECT SUM(jumlah) INTO total FROM pembelian WHERE  produk_id = id_prod;
END //
DELIMITER ;

CALL getProductPurchesed(2, @total);
SELECT @total AS total_product_purchesed;



DELIMITER //
CREATE PROCEDURE updateStockProduct(IN id_prod INT, IN jumlah INT)
BEGIN
    UPDATE produk SET stok = stok + jumlah WHERE id = id_prod;
END //
DELIMITER ;

CALL updateStockProduct(1, 10);
CALL getAllProduct();


DELIMITER //
CREATE PROCEDURE getTotalOrder()
BEGIN
    -- Statment
    DECLARE totalOrder INT DEFAULT 0;
    SELECT COUNT(*) INTO totalOrder FROM pesanan;
    SELECT totalOrder;
END //
DELIMITER ;

CALL getTotalOrder();

-- function sayHello()
DELIMITER $$
CREATE FUNCTION sayHelloName(name varchar(20))
RETURNS TEXT
BEGIN
    RETURN CONCAT("Hello, ", name);
END $$
DELIMITER ;

SELECT sayHelloName("Budi") AS function_sayHello;


DELIMITER //
CREATE FUNCTION gender(jk CHAR(1))
RETURNS VARCHAR(20)
BEGIN
    DECLARE jenis_kelmin VARCHAR(20);
    CASE jk
        WHEN "L" THEN
            SET jenis_kelmin = "Laki - Laki";
        ELSE
            SET jenis_kelmin = "Perempuan";
        END CASE;
    RETURN jenis_kelmin;
END //

SELECT nama AS Nama_Lengkap, gender(jk) AS Gender FROM pelanggan;

SHOW FUNCTION STATUS;


DELIMITER //
CREATE PROCEDURE changeHargaJual(IN jenis_prod_id INT, IN persen INT)
BEGIN
    UPDATE produk SET harga_jual = harga_jual + (harga_jual * (persen / 100))
    WHERE id = jenis_prod_id;
END //
DELIMITER ;



SELECT * FROM produk WHERE id = 1;
CALL changeHargaJual(1, 20);
SELECT * FROM produk WHERE id = 1;


SELECT * FROM pelanggan;

DELIMITER //
CREATE FUNCTION getUmur(tgl_lahir DATE)
RETURNS INT
BEGIN
    DECLARE age INT;
    SET age = DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), tgl_lahir)), '%Y') + 0;
    RETURN age;
END //
DELIMITER ;

SELECT nama, tgl_lahir, getUmur(tgl_lahir) AS umur FROM pelanggan;


DELIMITER //
CREATE FUNCTION getKategoriHarga(harga_beli INT)
RETURNS VARCHAR(20)
BEGIN
    DECLARE keterangan VARCHAR(20);
    IF (harga_beli < 500000) THEN
        SET keterangan = "Murah";
    ELSEIF (harga_beli >= 500000) AND (harga_beli < 3000000) THEN
        SET keterangan = "Sedang";
    ELSEIF (harga_beli >= 3000000) AND (harga_beli < 10000000) THEN
        SET keterangan = "Mahal";
    ELSEIF (harga_beli >= 1000000) THEN
        SET keterangan = "Sangat Mahal";
    END IF;
    RETURN keterangan;
END //
DELIMITER ;


SELECT nama, harga_beli, getKategoriHarga(harga_beli) as Kategori_Harga FROM produk;