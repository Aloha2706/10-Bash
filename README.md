Пишем скрипт test.sh который в приложении. 
crontab -e

0 * * * * /home/vagrant/test.sh

и получаем вот такой вывод в /var/mail/root


From root@nginx.localdomain  Mon Jan 30 21:00:02 2023
Return-Path: <root@nginx.localdomain>
X-Original-To: root@localhost
Delivered-To: root@localhost.localdomain
Received: by nginx.localdomain (Postfix, from userid 0)
id E771E408AF27; Mon, 30 Jan 2023 21:00:01 +0000 (UTC)
Date: Mon, 30 Jan 2023 21:00:01 +0000
To: root@localhost.localdomain
Subject: NGINX Log Info
User-Agent: Heirloom mailx 12.5 7/5/10
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-Id: <20230130210001.E771E408AF27@nginx.localdomain>
From: root@nginx.localdomain (root)

Данные за период:

30Jan2023155101-30Jan2023162916

Часто запрашиваемые адреса:
      6 192.168.88.1
      4 127.0.0.1
      3 192.168.88.130
      2 192.168.88.11


Список запрашиваемых URL:
      6 "GET / HTTP/1.1"
      4 "GET /test HTTP/1.1"
      1 "GET /img/html-background.png HTTP/1.1"
      1 "GET /img/header-background.png HTTP/1.1"
      1 "GET /img/centos-logo.png HTTP/1.1"
      1 "GET /favicon.ico HTTP/1.1"
      1 "GET /dgfd HTTP/1.1"


Возвращаемые коды:
      9 200
      6 404


Частые ошибки:
      4 open() "/usr/share/nginx/html/test" failed
      1 open() "/usr/share/nginx/html/favicon.ico" failed
      1 open() "/usr/share/nginx/html/dgfd" failed

