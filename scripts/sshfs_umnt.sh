#!/bin/bash

[[ $# -ne 1 ]] && echo "Host not provided." && exit 1

HOST=$1

sudo umount ~/$HOST

df -h
