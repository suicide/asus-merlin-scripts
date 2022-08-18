#!/bin/sh

waitTime=30

logger -t $(basename $0) "restarting vpn routing"
logger -t $(basename $0) "waiting for $waitTime"

sleep $waitTime

logger -t $(basename $0) "restarting"

service restart_vpnrouting0

logger -t $(basename $0) "restarted vpn routing"
