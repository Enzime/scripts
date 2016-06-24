#!/bin/sh

source ~/.api_keys

if [ -z "$PUUSH_API_KEY" ]
then
    echo "Add 'export PUUSH_API_KEY=\"apiKeyHere\"' to ~/.api_keys"
    exit 1
elif [ -z "$1" ]
then
    echo "Specify a file to be uploaded"
    exit 2
elif ! [ -f "$1" -a -r "$1" ]
then
    echo "File '$1' is not valid (it is not a file or it is not readable)"
    exit 3
fi

curl "https://puush.me/api/up" -# -F "k=$PUUSH_API_KEY" -F "z=poop" -F "f=@$1" | sed -E 's/^.+,(.+),.+,.+$/\1\n/'
