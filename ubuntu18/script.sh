echo "This is Sadhvik's script" >/tmp/bootstrap.log
touch /tmp/bootstrap.log
exec >/tmp/bootstrap.log 2>&1

curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.5.4-amd64.deb
sudo dpkg -i filebeat-6.5.4-amd64.deb
sudo sed -i 's|#host: "localhost:5601"|host: "192.168.29.75:5601"|g' /etc/filebeat/filebeat.yml
sudo sed -i 's|localhost:9200|192.168.29.75:9200|g' /etc/filebeat/filebeat.yml
sudo filebeat test output
sudo filebeat modules enable system
sudo filebeat setup
sudo service filebeat start

sudo vi /etc/filebeat/filebeat.yml
curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-6.5.4-amd64.deb
sudo dpkg -i metricbeat-6.5.4-amd64.deb
sudo sed -i 's|#host: "localhost:5601"|host: "192.168.29.75:5601"|g' /etc/metricbeat/metricbeat.yml
sudo sed -i 's|localhost:9200|192.168.29.75:9200|g' /etc/metricbeat/metricbeat.yml
sudo metricbeat modules enable system
sudo metricbeat setup
sudo service metricbeat start
