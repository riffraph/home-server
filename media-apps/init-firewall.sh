#!/bin/sh

firewall-cmd --permanent --remove-service=ssh
firewall-cmd --permanent --add-port=<ssh port>/tcp