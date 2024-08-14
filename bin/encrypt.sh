#!/usr/bin/env bash
KEY=$(cat ~/key.conf)
echo $1 | openssl aes-256-cbc -a -salt -pass pass:$KEY -pbkdf2