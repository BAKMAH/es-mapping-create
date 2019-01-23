#!/bin/bash

# the following code is designed because it always respect what is commented as deafult values

#define server conf file
server=/etc/zabbix/zabbix_server.conf

# ensures HistoryStorageURL=http://127.0.0.1:9200
grep "^HistoryStorageURL=" $server
if [ $? -eq 0 ]; then
sed -i "s/^HistoryStorageURL=.*/HistoryStorageURL=http:\/\/127.0.0.1:9200/" $server
else
ln=$(grep -n "HistoryStorageURL=" $server | egrep -o "^[0-9]+"); ln=$((ln+1)) 
sed -i "`echo $ln`iHistoryStorageURL=http:\/\/127.0.0.1:9200" $server
fi

# ensures HistoryStorageTypes=uint,dbl,str,log,text
grep "^HistoryStorageTypes=" $server
if [ $? -eq 0 ]; then
sed -i "s/^HistoryStorageTypes=.*/HistoryStorageTypes=uint,dbl,str,log,text0/" $server
else
ln=$(grep -n "HistoryStorageTypes=" $server | egrep -o "^[0-9]+"); ln=$((ln+1))
sed -i "`echo $ln`iHistoryStorageTypes=uint,dbl,str,log,text" $server
fi

# ensures HistoryStorageDateIndex=1
grep "^HistoryStorageDateIndex=" $server
if [ $? -eq 0 ]; then
sed -i "s/^HistoryStorageDateIndex=.*/HistoryStorageDateIndex=1/" $server
else
ln=$(grep -n "HistoryStorageDateIndex=1" $server | egrep -o "^[0-9]+"); ln=$((ln+1))
sed -i "`echo $ln`iHistoryStorageDateIndex=1" $server
fi

