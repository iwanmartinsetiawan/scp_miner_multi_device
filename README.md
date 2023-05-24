# scp_miner_multi_device

Sebelum menjalankan script, perlu install sshpass terlebih dahulu dengan command :
sudo apt install sshpass

Kemudian jalankan command berikut :
```bash
git clone https://github.com/iwanmartinsetiawan/scp_miner_multi_device.git
```
```bash
cd scp_miner_multi_device
```
```bash
nano scp_miner.sh
```

Ganti Pass12345 dengan password ssh device minernya.
Dengan asumsi semua passwordnya sama.

miner_list=( 192.168.5.10 192.168.5.11 192.168.5.12 )
Ganti dengan ip address device minernya, tiap ip address dipisah dengan tanda spasi.

sshpass -p ${password} ssh -o StrictHostKeyChecking=no root@$ip_addr 'rm -rf /root/ccminer'
Sesuaikan dengan folder yang ada di device miner tujuan

sshpass -p ${password} scp -o StrictHostKeyChecking=no -r /root/ccminer root@$ip_addr:/root
Sesuaikan dengan folder yang ada di device miner tujuan dan folder di device asal

sshpass -p ${password} ssh -o StrictHostKeyChecking=no root@$ip_addr 'pm2 restart ccminer'
Sesuaikan dengan nama process di pm2, untuk check nama proses yg berjalan bisa menggunakan pm2 ls

Jika config sudah selesai, keluar dan save script dengan tombol :
CTRL + X
tekan Y, terus ENTER 

Kemudian jalankan scriptnya menggunakan command
```bash
bash scp_miner.sh
```
