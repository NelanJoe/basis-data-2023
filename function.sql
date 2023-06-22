# select kode nama dan stok dikali harga beli sebagai asset
SELECT kode, nama, stok * harga_beli AS asset FROM produk;

/**
  * Month => build in fnc / fnc bawaan mysql/mariadb
  * current_date => merujuk ke saat ini
  */
SELECT MONTH(current_date);

/**
  * count => build in fnc / fnc bawaan mysql/mariadb => menghitung total
  * tanda * => semua
  */
SELECT count(*) as jumlah_pelanggan FROM pelanggan;

/**
  * Menghitung rata - rata
  * avg => build in fnc / fnc bawaan mysql/mariadb => menghitung rata - rata
  * tanda * => semua
  */

SELECT avg(harga_beli) as rata_rata_harga_beli FROM produk;


SELECT nama, CASE(jk)
    WHEN "p" THEN "Perempuan"
    ELSE "Laki - Laki"
    END as jenis_kelamin FROM pelanggan;


SELECT id, nama, harga_beli, IF(harga_beli > 50000, "Mahal", "Murah") AS status FROM produk;


SELECT jk, count(*) as jumlah from pelanggan group by jk;


select pesanan_id, sum(harga * qty) as total
from pesanan_items group by pesanan_id having total > 10000;



select nama, stok
from produk where stok > (2);