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


# BEGIN GitHub HTTPS git clone
echo "$PULL_STRING" | grep $GITHUB_HTTPS_RE >/dev/null

if [[ $? -eq 0 ]]; then    # matched regular expression successfully
	if [[ $# -ne 1 ]]; then   # no argument to script is present = was not click request
		QUIT_FLAG=1
		if [[ ${#PULL_STRING} -gt 50 ]]; then  # take 50 char substring of the URL if > 50 chars
			echo "git clone ${PULL_STRING:0:50}..."
		else
			echo "git clone $PULL_STRING"
		fi
	else
		QUIT_FLAG=1
		git clone "$PULL_STRING" >/dev/null 2>/dev/null &
	fi

fi

if [[ $QUIT_FLAG -eq 1 ]]; then
	exit 0
fi
# END GitHub HTTPS git clone


# BEGIN GitHub repository name clone
echo "$PULL_STRING" | grep $GITHUB_REPO_RE >/dev/null

if [[ $? -eq 0 ]]; then  # matched regular expression successfully
	if [[ $# -ne 1 ]]; then   # no argument to script is present = was not click request
		QUIT_FLAG=1
		if [[ ${#PULL_STRING} -gt 50 ]]; then  # take 50 char substring of the URL if > 50 chars
			echo "git clone ${PULL_STRING:0:50}..."
		else
			echo "git clone $PULL_STRING"
		fi
	else
		QUIT_FLAG=1
		git clone "https://github.com/$PULL_STRING.git" >/dev/null 2>/dev/null &
	fi
fi

if [[ $QUIT_FLAG -eq 1 ]]; then
	exit 0
fi
# END GitHub repository name clone

# BEGIN HTTP/HTTPS GET requests
echo "$PULL_STRING" | grep $HTTP_GET_RE >/dev/null

if [[ $? -eq 0 ]]; then  # matched regular expression successfully
	if [[ $# -ne 1 ]]; then   # no argument to script is present = was not click request
		QUIT_FLAG=1
		if [[ ${#PULL_STRING} -gt 50 ]]; then  # take 50 char substring of the URL if > 50 chars
			echo "Download ${PULL_STRING:0:50}..."
		else
			echo "Download $PULL_STRING"
		fi
	else
		QUIT_FLAG=1
		curl -L --silent --no-buffer --max-time 600 --retry 3 --show-error --connect-timeout 5 -O "$PULL_STRING" >/dev/null 2>/dev/null &
	fi
fi

if [[ $QUIT_FLAG -eq 1 ]]; then
	exit 0
fi
# END HTTP/HTTPS GET requests


# Default message for string match failure
echo "Clipboard does not include a supported pull string"



