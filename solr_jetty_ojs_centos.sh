yum -y install unzip
echo "installing jetty"
wget "http://dist.codehaus.org/jetty/jetty-6.1.26/jetty-6.1.26.zip" -O jetty.zip
mv jetty.zip /vagrant/plugins/generic/lucene/lib/
cd /vagrant/plugins/generic/lucene/lib/
unzip jetty.zip
rm jetty.zip
ln -s jetty-distribution-*/ jetty
echo "installing Solr"
wget https://archive.apache.org/dist/lucene/solr/3.6.2/apache-solr-3.6.2.zip
unzip apache-solr-3.6.2.zip
rm apache-solr-3.6.2.zip
ln -s apache-solr-3.6.2/ solr