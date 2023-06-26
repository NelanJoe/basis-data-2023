# Soal 1 - buat user tom & mark
CREATE USER 'tom'@'localhost' IDENTIFIED BY "password";
CREATE USER 'mark'@'localhost' IDENTIFIED BY "password";


# Soal 2 0
# GRANT ALL PRIVILEGES ON dbkoperasi.* TO 'tom'@'localhost';
GRANT SELECT ON dbkoperasi.* TO 'tom'@'localhost';
GRANT INSERT, UPDATE ON dbkoperasi.* TO 'tom'@'localhost';


# Soal 3
CREATE ROLE client1;


# Soal 4
GRANT SELECT ON dbkoperasi.* TO client1;

GRANT client1 TO 'mark'@'localhost';

