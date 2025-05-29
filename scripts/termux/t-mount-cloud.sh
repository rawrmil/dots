#!/bin/bash
sudo nsenter -t 1 -m -- \
sudo rclone mount nextcloud: /storage/emulated/0/Cloud \
	--gid 9997 \
	--dir-perms 0771 \
	--file-perms 0660 \
	--umask=0 \
	--allow-other \
	--vfs-cache-mode full \
	--vfs-cache-max-size 10G \
	--allow-non-empty \
	--vfs-fast-fingerprint \
	--dir-cache-time 1000h \
    --vfs-cache-poll-interval 10s

