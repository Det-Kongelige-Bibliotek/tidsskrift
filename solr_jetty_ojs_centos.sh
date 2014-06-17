wget "http://eclipse.org/downloads/download.php?file=/jetty/stable-9/dist/jetty-distribution-9.2.1.v20140609.tar.gz&r=1" -O jetty.tar.gz
mv jetty.tar.gz /vagrant/plugins/generic/lucene/lib/
cd /vagrant/plugins/generic/lucene/lib/
tar -xzvf jetty.tar.gz
rm jetty.tar.gz