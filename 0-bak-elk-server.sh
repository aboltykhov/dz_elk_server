#!/bin/bash

#На ELK-сервере, например в домашней /home/aminroot
#создаем папки для файлов elasticsearch kibana nginx, одной строкой
#Ключ -p создать папку в папке

#mkdir -p /tmp/dz_elk_server/server/etc/yum.repos.d/ /tmp/dz_elk_server/server/etc/elasticsearch/ /tmp/dz_elk_server/server/opt/kibana/config/ /tmp/dz_elk_server/server/etc/nginx/conf.d/ /tmp/dz_elk_server/elk.bak/client01/etc/logstash/conf.d/

#Копируем в созданные папки репы
#Ключ -а копирувать содержимое с атрибутами
#cp -a /etc/yum.repos.d/elasticsearch.repo /tmp/dz_elk_server/server/etc/yum.repos.d/elasticsearch.repo | cp -a /etc/yum.repos.d/kibana.repo /tmp/dz_elk_server/server/etc/yum.repos.d/kibana.repo | cp -a /etc/yum.repos.d/logstash.repo /tmp/dz_elk_server/server/etc/yum.repos.d/logstash.repo

#Копируем в созданные папки конфиги
#Ключ -а копирувать содержимое с атрибутами
#cp -a /etc/elasticsearch/elasticsearch.yml /tmp/dz_elk_server/server/etc/elasticsearch/ | cp -a /opt/kibana/config/kibana.yml /tmp/dz_elk_server/server/opt/kibana/config/ | cp -a /etc/logstash/conf.d/02-beats-input.conf /tmp/dz_elk_server/client01/etc/logstash/conf.d/02-beats-input.conf | cp -a /etc/logstash/conf.d/10-syslog-filter.conf /tmp/dz_elk_server/client01/etc/logstash/conf.d/10-syslog-filter.conf | cp -a /etc/logstash/conf.d/30-elasticsearch-output.conf /tmp/dz_elk_server/client01/etc/logstash/conf.d/30-elasticsearch-output.conf | cp -a /etc/nginx/conf.d/kibana.conf /tmp/dz_elk_server/server/etc/nginx/conf.d/ | cp -a /etc/nginx/nginx.* /tmp/dz_elk_server/server/etc/nginx/

#Перейти в папку для создания коммита
#cd /tmp/dz_elk_server && pwd && echo

#Активировать SSH ключ для входа на github.com
#eval $(ssh-agent -s)
#ssh-add /etc/ssh/key-new-web-server

#Установить, настроить и отправить в git
#yum -y install git
#git config --global user.name "Alexey Boltykhov"
#git config --global user.email aboltykhov@mail.ru
#git config --global core.editor vi
#git config pull.rebase false
#git init
git add .
git status
git commit -m "Бекап ELK-Сервера"
git remote add origin git@github.com:aboltykhov/dz_elk_server.git
git branch -M main
git push -u origin main

