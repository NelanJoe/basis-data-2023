/*
* Backup database
*/

# mysqldump -u root -p dbkoperasi > db_koperasi.sql


-- SEE database list
SHOW DATABASES;

/*
* Membuat user baru
*/
CREATE USER 'nelan'@'localhost' IDENTIFIED BY 'password';


/*
* Membuat hak akses ke dalam database
*/
GRANT ALL PRIVILEGES ON dbkoperasi.* TO 'nelan'@'localhost';

# Memberiakan akses
FLUSH PRIVILEGES;

SELECT * FROM mysql.user;

# DROP USER Yang dibuat
DROP USER 'nelan'@'localhost';


SHOW TABLES;


