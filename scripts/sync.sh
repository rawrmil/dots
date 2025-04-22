#!/bin/bash
echo "RUMYHUMY-DOTS-SYNC-START"
git pull --rebase
git add .
git commit -m "Auto-sync $(date)" || true
git push
echo "RUMYHUMY-DOTS-SYNC-END"
