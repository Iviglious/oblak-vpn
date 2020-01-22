#! /bin/bash

# Declare constants
HOME=/home/ec2-user
LOG=$HOME/startup.log
APP_LOG=$HOME/openvpn.log

# Functions
function logn
{
  echo $1 >> $LOG
}

function log
{
  dt=`date +'[%Y-%m-%d %H:%M:%S]'`
  logn "$dt $1"
}


# Main body

cd $HOME
log "Started..."


log "Update OS..."
sudo yum update -y >> $LOG 2>&1

log "Install OpenVPN..."
sudo yum install openvpn wget unzip -y >> $LOG 2>&1

log "Download VPN config..."
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1sFUsAHGsbYYzgbiSJraP3rEtFMvOYJPO' -O $HOME/open-vpn-server.zip >> $LOG 2>&1
unzip $HOME/open-vpn-server.zip -d $HOME/ >> $LOG 2>&1

log "Configure Network..."
sudo sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward=1/g' /etc/sysctl.conf >> $LOG 2>&1
sudo echo 1 > /proc/sys/net/ipv4/ip_forward >> $LOG 2>&1
sudo iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE >> $LOG 2>&1
sudo sysctl -p >> $LOG 2>&1


log "Start VPN..."
nohup sudo openvpn --config server.conf >> $APP_LOG 2>&1 &


log "Finished."
logn ""

