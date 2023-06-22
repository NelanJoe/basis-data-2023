/*
* Backup database
*/

# mysql -u root -p dbkoperasi > db_koperasi.sql

/*
* Membuat user baru
*/
CREATE USER 'nelan'@'localhost' IDENTIFIED BY 'password';


/*
* Membuat hak akses ke dalam database
*/
GRANT ALL PRIVILEGES ON dbkopersi.* TO 'nelan'@'localhost';

# Memberiakan akses
FLUSH PRIVILEGES;

SELECT * FROM mysql.user;

# DROP USER Yang dibuat
DROP USER 'nelan'@'localhost';


