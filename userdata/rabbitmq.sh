#!/bin/bash
sudo su -
apt-get update -y
echo 'deb http://www.rabbitmq.com/debian/ testing main' | sudo tee /etc/apt/sources.list.d/rabbitmq.list
apt-get update -y
apt-get install rabbitmq-server
systemctl start rabbitmq-server
systemctl enable rabbitmq-server
systemctl status rabbitmq-server
sudo sh -c 'echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config'
rabbitmqctl add_user test test
rabbitmqctl set_user_tags test administrator
systemctl restart rabbitmq-server


