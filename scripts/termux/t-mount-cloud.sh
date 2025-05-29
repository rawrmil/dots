#!/bin/bash
sudo nsenter -t 1 -m -- \
sudo rclone mount nextcloud: /storage/emulated/0/Cloud \
	--gid 9997 \
	--dir-perms 0771 \
	--file-perms 0660 \
	--umask=0 \
	--allow-other \
	--allow-non-empty \
	--vfs-cache-mode full \
	--vfs-cache-max-size 10G \
	--vfs-cache-max-age 48h \
    --vfs-cache-poll-interval 5s \
	--vfs-fast-fingerprint \
	--dir-cache-time 1000h \
	--cache-chunk-size 8M \
	--cache-workers 8 \
	--buffer-size 1G \
    --vfs-write-back 5s \
    --no-checksum \
    --no-modtime

