#!/bin/bash

chmod 777 tc

if [ "$1" != "" ]; then
	echo "当前指定值为：$1Mbps。"
	./tc $1
else
	echo "未指定限速值，默认2Mbps。"
	./tc 2
fi