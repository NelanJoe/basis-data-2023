
# JOIN table Sederhana
# INNER JOIN
SELECT produk.id, produk.kode, produk.nama, jenis_produk.nama AS jenis
FROM produk INNER JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id;

# LEFT JOIN
SELECT pelanggan.id, pelanggan.nama, pelanggan.jk AS jenis_kelamin, kartu.nama AS kartu
FROM pelanggan LEFT JOIN kartu ON pelanggan.kartu_id = kartu.id;

# RIGHT JOIN
SELECT pelanggan.id, pelanggan.nama, pelanggan.jk, kartu.nama AS kartu
FROM pelanggan RIGHT JOIN kartu ON kartu.id = pelanggan.kartu_id;


# WORKSHEET 4 Soal 4.1
# INNER JOIN
CREATE VIEW vw_pesanan_pelanggan
AS SELECT pesanan.id, pesanan.tanggal, pesanan.total,
       pelanggan.nama AS nama,
       kartu.nama AS nama_kartu, kartu.diskon AS diskon
FROM pesanan
    RIGHT JOIN pelanggan ON pelanggan.id = pesanan.id
    RIGHT JOIN kartu ON kartu.id = pesanan.id;

# LEFT JOIN
SELECT pembelian.*,
       produk.nama AS nama_produk,
       vendor.nama AS nama_vendor
FROM pembelian
    LEFT JOIN produk ON produk.id = 1
    LEFT JOIN vendor ON vendor.id = 1;

# RIGHT JOIN
SELECT pesanan.id, pesanan.tanggal, pesanan.total,
       pelanggan.nama AS nama_pelanggan,
       produk.nama AS nama_produk,
       jenis_produk.nama AS nama_jenis_produk,
       pesanan_items.qty AS quantity, pesanan_items.harga AS harga_jual
FROM pesanan
    RIGHT JOIN pelanggan ON pelanggan.id = pesanan.id
    RIGHT JOIN produk ON produk.id = pesanan.id
    RIGHT JOIN jenis_produk ON jenis_produk.id = pesanan.id
    RIGHT JOIN pesanan_items ON pesanan_items.id = pesanan.id;



/**
  * WORKSHEET 4 Soal 4.2
 */
# MAKE VIEW => membuat view
# INNER JOIN
CREATE VIEW vw_pesanan_pelanggan
AS SELECT pesanan.id, pesanan.tanggal, pesanan.total,
       pelanggan.nama AS nama,
       kartu.nama AS nama_kartu, kartu.diskon AS diskon
FROM pesanan
    INNER JOIN pelanggan ON pelanggan.id = pesanan.id
    INNER JOIN kartu ON kartu.id = pesanan.id;

# LEFT JOIN
CREATE VIEW vw_pembelian
AS SELECT pembelian.id, pembelian.tanggal, pembelian.nomor, pembelian.jumlah, pembelian.harga,
       produk.nama AS nama_produk,
       vendor.nama AS nama_vendor
FROM pembelian
    LEFT JOIN produk ON produk.id = 1
    LEFT JOIN vendor ON vendor.id = 1;

# RIGHT JOIN
CREATE VIEW vw_pesanan
AS SELECT pesanan.id, pesanan.tanggal, pesanan.total,
       pelanggan.nama AS nama_pelanggan,
       produk.nama AS nama_produk,
       jenis_produk.nama AS nama_jenis_produk,
       pesanan_items.qty AS quantity, pesanan_items.harga AS harga_jual
FROM pesanan
    RIGHT JOIN pelanggan ON pelanggan.id = pesanan.id
    RIGHT JOIN produk ON produk.id = pesanan.id
    RIGHT JOIN jenis_produk ON jenis_produk.id = pesanan.id
    RIGHT JOIN pesanan_items ON pesanan_items.id = pesanan.id;



