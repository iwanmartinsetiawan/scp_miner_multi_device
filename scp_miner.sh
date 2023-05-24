#!/bin/bash
password="Pass12345" #Change with your ssh password miner device
miner_list=( 192.168.5.10 192.168.5.11 192.168.5.12 ) #Change With your ip address list miner
for ip_addr in "${miner_list[@]}"
do
	echo "$ip_addr"
    sshpass -p ${password} ssh -o StrictHostKeyChecking=no root@$ip_addr 'rm -rf /root/ccminer' #Change directory with destination directory
    sshpass -p ${password} scp -o StrictHostKeyChecking=no -r /root/ccminer root@$ip_addr:/root #Change directory with destination directory
    sshpass -p ${password} ssh -o StrictHostKeyChecking=no root@$ip_addr 'pm2 restart ccminer' #Change with name program/process in pm2
done
