



 开放指定端口 


- `firewall-cmd --zone=public --add-port=8080/tcp --permanent`


1. close directed port


- 	`firewall-cmd --zone=public --remove-port=8080/tcp --permanent`
1. valid immediately


- 	`firewall-cmd --reload`
1. show all opened port


- 	`firewall-cmd --zone=public --list-ports`


1. open port to an ip


- `firewall-cmd --permanent --add-rich-rule="rule family="ipv4" source address="192.168.2.37" port protocol="tcp" port="6379" accept"`