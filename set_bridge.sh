sudo ip link add br0 type bridge
sudo ip addr add 192.168.8.1/24 dev br0
sudo ip link set br0 up
echo 'allow br0' | sudo tee -a /etc/qemu/bridge.conf
sudo iptables -t nat -A POSTROUTING -s 192.168.8.0/24 -o eno1 -j MASQUERADE
