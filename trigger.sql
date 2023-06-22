CREATE TABLE pelanggan_log
(
    id          int primary key auto_increment,
    old_nama    varchar(100),
    new_nama    varchar(100),
    change_date DATETIME
);

SELECT *
FROM pelanggan;

SELECT *
FROM pelanggan_log;


DELIMITER $$
CREATE TRIGGER update_pelanggan
    BEFORE UPDATE
    ON pelanggan
    FOR EACH ROW
BEGIN
    INSERT INTO pelanggan_log
    SET old_nama    = OLD.nama,
        new_nama    = NEW.nama,
        change_date = NOW();
END $$
DELIMITER ;


UPDATE pelanggan
SET nama ='Joko Susanto'
WHERE id = 1;



CREATE TABLE pelanggan_audit
(
    id            int primary key auto_increment,
    kodePelanggan varchar(10) not null,
    nama          varchar(45) not null,
    changedate    datetime    default null,
    action        varchar(50) default null
);


SHOW TRIGGERS;


CREATE TRIGGER after_pembelian_insert
    AFTER INSERT
    ON pembelian
    FOR EACH ROW
    UPDATE produk
    SET stok = stok + NEW.jumlah
    WHERE id = NEW.produk_id;

INSERT INTO pembelian(id, tanggal, nomor, produk_id, jumlah, harga, vendor_id)
VALUES (default, '2022-06-09', 'P006', 3, 5, 350000, 5);


SELECT *
FROM produk;


DELIMITER //
CREATE TRIGGER after_pembelian_items_insert
    AFTER INSERT
    ON pesanan_items
    FOR EACH ROW
BEGIN
    DECLARE total_harga DOUBLE;
    SET total_harga = NEW.harga * NEW.qty;
    UPDATE pesanan
    SET total = total + total_harga
    WHERE id = NEW.pesanan_id;
END //
DELIMITER ;

SELECT *
FROM pesanan;

SELECT *
FROM pesanan_items;

INSERT INTO pesanan(id, tanggal, total, pelanggan_id)
VALUES (default, '2023-06-09', 0, 3);

INSERT INTO pesanan_items(id, produk_id, pesanan_id, qty, harga)
VALUES (default, 4, 11, 2, 60000);

