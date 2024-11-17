

- addd a user jenkins belongs to wheel group
----------

	sudo useradd jenkins
	sudo passwd jenkins
	sudo usermod -aG wheel jenkins
	groups jenkins


- switch to another user

----------
	sudo su - jenkins