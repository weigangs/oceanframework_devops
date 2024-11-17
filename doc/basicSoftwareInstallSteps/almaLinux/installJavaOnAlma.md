- install jdk 11 on alma


-    `sudo dnf update -y`
- 	`sudo dnf install java-11-openjdk-devel -y`
- 	`java -version`

----------
	export JAVA_HOME=$(dirname $(dirname $(readlink $(readlink $(which java)))))
	export PATH=$JAVA_HOME/bin:$PATH
	