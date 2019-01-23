# Create ElasticSearch mapping for zabbix 4.0

This is tested and works with ElasticSearch version 6.1.4

## Install binaries

```
yum -y install java-1.8.0-openjdk
curl https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.1.4.rpm -o elasticsearch-6.1.4.rpm
rpm -ivh elasticsearch-6.1.4.rpm
```

## Remove previous configuration

If you previously did not properly configure then these steps must be executed:
```
# check existing setup
curl -X GET http://localhost:9200/_cat/indices?v

# stop zabbix server
systemctl stop zabbix-server

# remove existing mapping
curl -X DELETE http://localhost:9200/uint
curl -X DELETE http://localhost:9200/dbl
curl -X DELETE http://localhost:9200/str
curl -X DELETE http://localhost:9200/log
curl -X DELETE http://localhost:9200/text

# check if no mapping is there
curl -X GET http://localhost:9200/_cat/indices?v
# it should report 'health status index uuid pri rep docs.count docs.deleted store.size pri.store.size'
```

## Create new mapping

```
cd
curl https://raw.githubusercontent.com/catonrug/es-mapping-create/master/step-1-create_elastic_mapping.sh > step-1-create_elastic_mapping.sh
curl https://raw.githubusercontent.com/catonrug/es-mapping-create/master/step-2-create_elastic_template.sh > step-2-create_elastic_template.sh
curl https://raw.githubusercontent.com/catonrug/es-mapping-create/master/step-3-create_elastic_pipeline.sh > step-3-create_elastic_pipeline.sh
chmod +x step*
./step-1-create_elastic_mapping.sh
./step-2-create_elastic_template.sh
./step-3-create_elastic_pipeline.sh
```

## Start Zabbix server

```
systemctl start zabbix-server
```



