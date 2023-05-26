#!/usr/bin/env bash

ip addr add 198.100.100.27/24 dev eth0
ip route add default via 198.100.100.1

echo "nameserver 1.1.1.1" >>/etc/resolv.conf
echo "nameserver 1.0.0.1" >>/etc/resolv.conf
