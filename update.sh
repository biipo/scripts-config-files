#!/bin/bash

function download_discord {
	read -p "Do you want to install discord? [y/n] " r
	if [ $r = 'y' ]; then
		printf "Downloading...";
		wget --https-only -q -O /tmp/discord.deb https://discord.com/api/download?platform=linux&format=deb;
		wait
		echo "Download finished";
		sleep 1;
		wait
		echo "Installation...";
		if sudo apt install /tmp/discord.deb; then
			echo "Installation finished...";
		else
			echo "Discord NOT installed"
		fi
	else
		echo "Could not install discord app";
		exit 1;
	fi
}

function download_local_send {
	echo "Checking lastest version of local send...";
	version=$(git -c 'versionsort.suffix=-' ls-remote --tags --sort='v:refname' \
		https://github.com/localsend/localsend | tail --lines=1 | cut --delimiter='/' --fields=3 2>&1);
	wait
	echo "Last version: $version";
	url="https://github.com/localsend/localsend/releases/download/"$version"/LocalSend-"${version:1}"-linux-x86-64.deb";

	# check current version installed before ask for installation

	read -p "Do you want to install discord? [y/n] " r

	if [ $r = 'y' ]; then
		echo "Downloading local send deb file from: $url ...";
		wget --https-only -q -O /tmp/localsend.deb "${url}" > /dev/null
		wait
		echo "Starting installation...";
		sudo apt install ./tmp/localsend.deb;
		wait
		echo "Finished installation..."
	else
		echo "Could not install local-send app";
		exit 1;
	fi
}

if [ $1 = 'discord' ]; then
	download_discord
elif [ $1 = 'local-send' ]; then
	download_local_send
fi
