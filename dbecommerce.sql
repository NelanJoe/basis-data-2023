SELECT * FROM kategori_produk;

SHOW TABLES;

DELIMITER //
CREATE TRIGGER update_total_harga_pesanan
    AFTER INSERT
    ON pelanggan
    FOR EACH ROW
BEGIN
    UPDATE pesanan SET total_harga
END //
DELIMITER  ;

DROP TRIGGER update_stock;

SELECT * FROM produk;

INSERT INTO produk(id, kode, nama, hrg_beli, hrg_jual, stok, min_stok, kategori_produk_id)
VALUES (5, "TV2", "TV Samsung", 2000000, 2500000, 10, 1, 3);
