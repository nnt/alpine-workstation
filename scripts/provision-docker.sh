#!/bin/bash

apk add docker --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/latest-stable/community
service docker start
rc-update add docker boot

# references
# https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management#Add_a_Package
# https://wiki.alpinelinux.org/wiki/Docker#Installation