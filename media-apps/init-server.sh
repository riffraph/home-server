#!/bin/sh

# create docker network

docker network create \
-d macvlan \
--subnet=192.168.86.0/24 \
--gateway=192.168.86.1 \
--ip-range=192.168.86.30/30 \
-o parent=<external facing network interface> \
docker-network


# create groups

groupadd -g 1002 downloader


# create users

useradd -U nzbget -G 1002
useradd -U sonarr -G 1002
useradd -U plex -G 1002


# create folders

mkdir /downloads
mkdir -p /media/movies
mkdir -p /media/tv
mkdir -p /serverapps/nzbget/config
mkdir -p /serverapps/sonarr/config
mkdir -p /serverapps/plex/config
mkdir -p /serverapps/plex/transcode