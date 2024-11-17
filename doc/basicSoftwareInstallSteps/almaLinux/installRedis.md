

1. dnf update
1. dnf install epel-release
1. dnf install redis
1. systemctl status redis
1. systemctl enable redis
1. systemctl start redis
1. systemctl status redis


- modify config and restart


1. vi/etc/redis/redis.conf


1. bind 127.0.0.1 192.168.2.37


1. systemctl restart redis