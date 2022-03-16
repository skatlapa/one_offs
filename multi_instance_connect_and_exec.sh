#!/usr/bin/env bash

set -o errexit

trap "EXIT 130" INT

SERVER_NAMES_FILE=$1
COMMAND=$2

while IFS="\n" read -r SERVER_NAME; do
    [[ "$SERVER_NAME" =~ ^[[:space:]]*# ]] && continue
    ssh $SERVER_NAME "$COMMAND"
done < $SERVER_NAMES_FILE
