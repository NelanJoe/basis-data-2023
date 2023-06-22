use dbtokoonline;

DELIMITER //
CREATE OR REPLACE TRIGGER after_insert_stock
    AFTER INSERT ON pesanan
    FOR EACH ROW
BEGIN
    UPDATE produk SET stok = stok + NEW.jumlah
    WHERE id = NEW.produk_id;
END //
DELIMITER ;


INSERT INTO pesanan(id, kode, tgl, produk_id, pelanggan_id, jumlah, keterangan)
VALUES (default, "P001", "2023-06-09", 1, 2, 10, "hello");


SELECT * FROM pesanan;

SELECT * FROM produk;