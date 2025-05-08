#!/bin/bash

year=$(date +%Y)
date=$(date +%m-%d)
mkdir -p ~/dots/notes/daily/$year
nvim ~/dots/notes/daily/$year/$date
