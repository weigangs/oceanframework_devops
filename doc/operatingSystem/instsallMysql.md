

- install mysql-server
- 

----------
	sudo useradd -r -s /bin/false mysql
	sudo dnf install mysql-server -y
	sudo chown -R mysql:mysql /var/lib/mysql
	sudo chown -R mysql:mysql /var/log/mysql
	sudo mysqld --initialize --user=mysql
	sudo systemctl start mysqld
	sudo systemctl enable mysqld
	sudo mysql_secure_installation

----------


- find default root password：
- sudo cat /var/log/mysql/mysqld.log | grep password

----------


- create a db and a user corospond to the db
	
	

1. `CREATE DATABASE gooddb default character set utf8mb4 collate utf8mb4_unicode_ci;`
2. `CREATE USER 'gooddb'@'localhost' IDENTIFIED BY 'your_password';`
3. `GRANT ALL PRIVILEGES ON gooddb.* TO 'gooddb'@'localhost';`
4. `FLUSH PRIVILEGES;`