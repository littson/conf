#!/usr/bin/env bash
url_file=$1
for url in $(cat $url_file); do
	echo $url
	echo "============"
	curl -L "$url"
	echo "============"
done
