#!/bin/sh

[ -z "$1" ] && {
	echo "please specify version in first positional argument." >&2
	exit 1
}

F="$(mktemp)"
mv "$F" "$F.deb"
F="$F.deb"
curl https://dl.discordapp.net/apps/linux/$1/discord-$1.deb > $F
sudo apt install --reinstall -y $F
rm -f "$F"
exit 0
