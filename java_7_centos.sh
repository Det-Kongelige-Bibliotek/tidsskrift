echo "Installing java"
wget http://linux-drift-01.kb.dk/files/software/downloads/java/jdk-7u55-linux-i586.tar.gz
tar -zxvf jdk-7u55-linux-i586.tar.gz
mkdir /usr/local/java
mv jdk1.7.0_55/ /usr/local/java
touch /etc/profile.d/custom.sh
export "JAVA_HOME=/usr/local/java/jdk1.7.0_55/" >> /etc/profile.d/custom.sh
export "PATH=$JAVA_HOME/bin:$PATH" >> /etc/profile.d/custom.sh