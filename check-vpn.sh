#!/bin/sh

# thanks to https://www.snbforums.com/threads/vpn-connectivity-test-and-reconnect-script.74892/post-714911
{
for i in 1 2 3 4 5
do
  if [ `nvram get vpn_client"$i"_state` -gt 0 ]
  then
    echo "VPN $i Enabled"
    if ! ping -c1 -I tun1"$i" 8.8.8.8 &>/dev/null
    then
      echo "VPN $i down, restarting..."
      service restart_vpnclient"$i"
    else
      echo "VPN $i up, no action required"
    fi
  fi
done
} 2>&1 | logger -t $(basename $0)[$$]
