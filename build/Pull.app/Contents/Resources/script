#!/bin/sh

LC_CTYPE=UTF-8
HTTP_GET_RE='^https*://'
GITHUB_HTTPS_RE='^https*://.*\.git$'
GITHUB_SSH_RE='^git@github.com:.*\.git$'
GITHUB_REPO_RE='^[a-zA-Z0-9.\_-]*/[a-zA-Z0-9._-]*$'

QUIT_FLAG=0


PULL_STRING=`pbpaste`

# Make Default Directory the current working directory
cd ~/Downloads


# GitHub HTTPS git clone
echo $PULL_STRING | grep $GITHUB_HTTPS_RE >/dev/null

if [[ $? -eq 0 ]]; then
	QUIT_FLAG=1
	echo "Cloning $PULL_STRING"
	git clone $PULL_STRING >/dev/null 2>/dev/null &
fi

if [[ $QUIT_FLAG -eq 1 ]]; then
	exit 0
fi


# GitHub repository name clone
echo $PULL_STRING | grep $GITHUB_REPO_RE >/dev/null

if [[ $? -eq 0 ]]; then
	QUIT_FLAG=1
	echo "Cloning GitHub repository $PULL_STRING"
	git clone "https://github.com/$PULL_STRING.git" >/dev/null 2>/dev/null &
fi

if [[ $QUIT_FLAG -eq 1 ]]; then
	exit 0
fi


# HTTP/HTTPS GET requests
echo $PULL_STRING | grep $HTTP_GET_RE >/dev/null

if [[ $? -eq 0 ]]; then
	QUIT_FLAG=1
	echo "Pulling $PULL_STRING"
	wget -q --timestamping --unlink --background $PULL_STRING >/dev/null 2>/dev/null
fi

if [[ $QUIT_FLAG -eq 1 ]]; then
	exit 0
fi

echo "[ERROR] clipboard data does not appear to be a supported string"



