#!/bin/sh

LC_CTYPE=UTF-8
HTTP_GET_RE='^https\{0,1\}://'
GITHUB_HTTPS_RE='^https\{0,1\}://.*\.git$'
GITHUB_REPO_RE='^[a-zA-Z0-9.\_-]*/[a-zA-Z0-9._-]*$'

QUIT_FLAG=0  # used for early exit once regular expression matches and pull occurs


PULL_STRING=`pbpaste`  # get string in clipboard
PULL_DIR="$HOME/Downloads"  # set default download directory as ~/Downloads


# Make download directory the working directory
cd "$PULL_DIR"
# confirm that we are able to change to appropriate download directory, exit and abort if not
if [[ $? -ne 0 ]]; then
	echo "Error: Unable to access pull directory.  Aborted."
	exit 1
fi


# GitHub HTTPS git clone
echo "$PULL_STRING" | grep $GITHUB_HTTPS_RE >/dev/null

if [[ $? -eq 0 ]]; then
	QUIT_FLAG=1
	echo "Cloning $PULL_STRING"
	git clone "$PULL_STRING" >/dev/null 2>/dev/null &
fi

if [[ $QUIT_FLAG -eq 1 ]]; then
	exit 0
fi


# GitHub repository name clone
echo "$PULL_STRING" | grep $GITHUB_REPO_RE >/dev/null

if [[ $? -eq 0 ]]; then
	QUIT_FLAG=1
	echo "Cloning GitHub repository $PULL_STRING"
	git clone "https://github.com/$PULL_STRING.git" >/dev/null 2>/dev/null &
fi

if [[ $QUIT_FLAG -eq 1 ]]; then
	exit 0
fi


# HTTP/HTTPS GET requests
echo "$PULL_STRING" | grep $HTTP_GET_RE >/dev/null

if [[ $? -eq 0 ]]; then
	QUIT_FLAG=1
	echo "Pulling $PULL_STRING"
	curl -L --silent --no-buffer --max-time 600 --retry 3 --show-error --connect-timeout 5 -O "$PULL_STRING" >/dev/null 2>/dev/null &
fi

if [[ $QUIT_FLAG -eq 1 ]]; then
	exit 0
fi

echo "[ERROR] clipboard data does not appear to be a supported string"



