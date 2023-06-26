CREATE DATABASE dbkursus;
USE dbkursus;

CREATE TABLE kategori(
    id int primary key auto_increment,
    nama varchar(225) not null
);

CREATE TABLE materi(
    id int primary key auto_increment,
    kode char(10) not null unique,
    nama varchar(225) not null,
    deskripsi text,
    durasi_jam varchar(10),
    biaya int,
    kategori_id int,
    foreign key (kategori_id) references kategori(id)
);

CREATE TABLE pengajar(
    id int primary key auto_increment,
    nip char(10) not null unique,
    nama varchar(125),
    gender enum("L", "P"),
    no_hp varchar(13),
    email varchar(125),
    alamat text not null,
    foto varchar(125),
    materi_id int,
    foreign key (materi_id) references materi(id)
);

CREATE TABLE peserta(
    id int primary key auto_increment,
    nama varchar(125),
    gender enum("L", "P"),
    no_hp varchar(13),
    email varchar(125),
    alamat text not null,
    foto varchar(125),
    materi_id int,
    foreign key (materi_id) references materi(id)
);

CREATE TABLE penjadwalan_kelas(
    id int primary key auto_increment,
    kode_kelas char(10) not null unique,
    kelas varchar(125),
    hari varchar(50),
    tgl_mulai DATE,
    tgl_akhir DATE,
    jam_mulai TIME,
    jam_akhir TIME,
    materi_id int,
    pengajar_id int,
    peserta_id int,
    foreign key (materi_id) references materi(id),
    foreign key (pengajar_id) references pengajar(id),
    foreign key (peserta_id) references peserta(id)
);


# Insert data
INSERT INTO kategori(id, nama)
VALUES (default, 'Programming'),
       (default, 'Database'),
       (default, 'Networking');

INSERT INTO materi(id, kode, nama, deskripsi, durasi_jam, biaya, kategori_id)
VALUES (default, 'MTR1', 'INTRO HTML', 'Pengenalan Bahasa HTML', '1', 300000, 1),
       (default, 'MTR2', 'INTRO MYSQL', 'Pengenalan MYSQL', '2', 200000, 2),
       (default, 'MTR3', 'INTRO MIKROTIK', 'Pengenalan Branding Jaringan MIKROTIK', '2', 100000, 3);

INSERT INTO pengajar(id, nip, nama, gender, no_hp, email, alamat, foto, materi_id)
VALUES (default, '011111', 'Sirojul Munir', 'L', '011111111', 'sirojul1@mail.com', 'Bogor', 'sirojul.png', 1),
       (default, '022222', 'Nasrul', 'L', '022222222', 'nasrul2@mail.com', 'Jakarta', 'nasrul.png', 2),
       (default, '033333', 'Lukman Rosyidi', 'L', '0333333333', 'lukman3@mail.com', 'Bandung', 'lukman.png', 3);


INSERT INTO peserta(id, nama, gender, no_hp, email, alamat, foto, materi_id)
VALUES (default, 'Budi Santoso', 'L', '0121212112', 'budisantoso@mail.com', 'Bogor', 'budi_santoso.png', 1),
       (default, 'Susan Safira', 'L', '03232323232', 'susansafira@mai.com', 'Kemang', 'susan_safira.png', 2),
       (default, 'Joko Susilo', 'P', '04343434343', 'jokosusanto@mail.com', 'Depok', 'joko_susanto.png', 3);

INSERT INTO penjadwalan_kelas(id, kode_kelas, kelas, hari, tgl_mulai, tgl_akhir, jam_mulai, jam_akhir, materi_id, pengajar_id, peserta_id)
VALUES (NULL, 'K001', 'HTML 1', '2023-02-10', '2023-02-10', '2023-02-15', '07:00:00', '8:00:00', 1, 1, 1),
       (NULL, 'K002', 'MYSQL 2', '2023-02-11', '2023-02-11', '2023-02-16', '07:00:00', '9:00:00', 2, 2, 2),
       (NULL, 'K003', 'MKRTK 3', '2023-02-12', '2023-02-12', '2023-02-17', '07:00:00', '9:00:00', 3, 3, 3);


SELECT * FROM kategori;
SELECT * FROM materi;
SELECT * FROM peserta;
SELECT * FROM pengajar;
SELECT * FROM penjadwalan_kelas;

# INNER JOIN pengajar
SELECT pengajar.*,
       materi.*
FROM pengajar
INNER JOIN materi ON pengajar.materi_id = materi.id;

# INNER JOIN peserta
SELECT peserta.*,
       materi.*
FROM peserta
INNER JOIN materi ON peserta.materi_id = materi.id;

# INNER JOIN penjadwalan kelas
SELECT penjadwalan_kelas.*,
       materi.nama AS Nama_Materi,
       pengajar.nama AS Nama_Pengajar,
       peserta.nama AS Nama_Peserta
FROM penjadwalan_kelas
INNER JOIN materi ON penjadwalan_kelas.materi_id = materi.id
INNER JOIN pengajar ON penjadwalan_kelas.pengajar_id = pengajar.id
INNER JOIN peserta ON penjadwalan_kelas.peserta_id = peserta.id;