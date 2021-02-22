#!/bin/bash

#На ELK-сервере, например в домашней /home/aminroot
#создаем папки для файлов elasticsearch kibana nginx, одной строкой
#Ключ -p создать папку в папке

mkdir -p /home/adminroot/elk.bak/server/etc/yum.repos.d/ /home/adminroot/elk.bak/server/etc/elasticsearch/ /home/adminroot/elk.bak/server/opt/kibana/config/ /home/adminroot/elk.bak/server/etc/nginx/conf.d/ /home/adminroot/elk.bak/client01/etc/logstash/conf.d/

#Копируем в созданные папки репы
#Ключ -а копирувать содержимое с атрибутами
cp -a /etc/yum.repos.d/elasticsearch.repo /home/adminroot/elk.bak/server/etc/yum.repos.d/elasticsearch.repo | cp -a /etc/yum.repos.d/kibana.repo /home/adminroot/elk.bak/server/etc/yum.repos.d/kibana.repo | cp -a /etc/yum.repos.d/logstash.repo /home/adminroot/elk.bak/server/etc/yum.repos.d/logstash.repo

#Копируем в созданные папки конфиги
#Ключ -а копирувать содержимое с атрибутами
cp -a /etc/elasticsearch/elasticsearch.yml /home/adminroot/elk.bak/server/etc/elasticsearch/ | cp -a /opt/kibana/config/kibana.yml /home/adminroot/elk.bak/server/opt/kibana/config/ | cp -a /etc/logstash/conf.d/02-beats-input.conf /home/adminroot/elk.bak/client01/etc/logstash/conf.d/02-beats-input.conf | cp -a /etc/logstash/conf.d/10-syslog-filter.conf /home/adminroot/elk.bak/client01/etc/logstash/conf.d/10-syslog-filter.conf | cp -a /etc/logstash/conf.d/30-elasticsearch-output.conf /home/adminroot/elk.bak/client01/etc/logstash/conf.d/30-elasticsearch-output.conf | cp -a /etc/nginx/conf.d/kibana.conf /home/adminroot/elk.bak/server/etc/nginx/conf.d/ | cp -a /etc/nginx/nginx.* /home/adminroot/elk.bak/server/etc/nginx/

#Перейти в папку для создания коммита
cd /home/adminroot/elk.bak && pwd

#Активировать SSH ключ для входа на github.com
eval $(ssh-agent -s)
ssh-add /etc/ssh/key-new-web-server

#Установить, настроить и отправить в git
#yum -y install git
#git config --global user.name "Alexey Boltykhov"
#git config --global user.email aboltykhov@mail.ru
#git config --global core.editor vi
git init
git add .
git commit -m "Бекап ELK-Сервера"
git remote add origin git@github.com:aboltykhov/dz_elk_server.git
git branch -M main
git push -u origin main
