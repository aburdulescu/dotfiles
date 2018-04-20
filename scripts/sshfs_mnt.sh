#!/bin/bash

[[ $# -ne 1 ]] && echo "Host not provided." && exit 1

HOST=$1

sudo sshfs -o allow_other aburdulescu@$HOST.spr:/ ~/$HOST

df -h | grep $HOST
