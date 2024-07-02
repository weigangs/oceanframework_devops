

- install vmware tools on alma linux vm instance

----------

	sudo dnf install -y perl gcc make kernel-headers kernel-devel
	sudo mkdir /mnt/cdrom
	sudo mount /dev/cdrom /mnt/cdrom
	cd /mnt/cdrom
	sudo tar -zxvf VMwareTools-*.tar.gz -C /tmp
	cd /tmp/vmware-tools-distrib
	sudo ./vmware-install.pl
	vmware-toolbox-cmd -v
	sudo reboot