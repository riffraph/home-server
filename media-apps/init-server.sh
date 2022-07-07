#!/bin/sh

# create network for the media server

docker network create \
-d macvlan \
--subnet=192.168.86.0/24 \
--gateway=192.168.86.1 \
--ip-range=192.168.86.30/30 \
-o parent=<external facing network interface> \
media-network


# create groups

groupadd -g 1002 downloader
groupadd -g 1003 media


# create users

useradd -U nzbget -G downloader
useradd -U sonarr -G downloader
usermod -a -G media sonarr
useradd -U plex -G media


# create folders

mkdir /downloads
mkdir -p /media/movies
mkdir -p /media/tv
mkdir -p /serverapps/nzbget/config
mkdir -p /serverapps/sonarr/config
mkdir -p /serverapps/plex/config
mkdir -p /serverapps/plex/transcode


# set up owners
chown -R plex.media /media

chown -R nzbget.downloader /downloads

chown -R nzbget.nzbget /serverapps/nzbget
chown -R sonarr.sonarr /serverapps/sonarr
chown -R plex.plex /serverapps/plex


# set up utilities
cp updatePermissions.sh /serverapps