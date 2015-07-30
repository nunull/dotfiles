export PYTHONPATH="/Library/Python/2.7/site-packages/:$PYTHONPATH"
export GOPATH="$HOME/Coding/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="/usr/local/lib/node_modules:$PATH"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="$HOME/bin:$PATH"
export GHC_DOT_APP="/Applications/ghc-7.8.4.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

R="\[\e[31m\]" # Red
O="\[\e[0m\]"  # Off
export PS1="${R}\u${O} (${R}\W${O}) "

export EDITOR=vim

alias ls="ls -G"
alias subl="/Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2"
#alias python="python3"
alias imagecap="~/Coding/python/imagecap/imagecap.py"

pynotifier() {
	cd ~/Coding/python/arduino-notifier && ./notifier.py
}

# Edit some text in $EDITOR and copy it to the clipboard.
clip() {
	$EDITOR ~/.tmp
	if [ -e ~/.tmp ]; then
		cat ~/.tmp | pbcopy
		rm ~/.tmp
	fi
}

# SSH into uberspace-account.
#uber() {
#	ssh nunl@markab.uberspace.de
#}

# Edit notes.
cur() {
	$EDITOR ~/notes/cur.md 
	#push_notes
}

# Push the notes repository to remote.
#push_notes() {
#	CUR=$(pwd)
#	cd ~/notes
#	git add -A
#	git commit -m "update"
#	git push
#	cd $CUR
#}

# A clock.
clock() {
	while [ 1 ]; do
		echo -e -n "\r$(date)"
		sleep 1
	done
}

# Shows or hides hidden files in the Finder.
# $1: YES or NO
showhidden() {
	defaults write com.apple.finder AppleShowAllFiles $1
	killall Finder
}

# Creates a directory and changes to it.
mkcd() {
	if [ $# == 1 ]; then
		mkdir $1 && cd $1
	else
		echo "mkcd: Creates a directory and changes to it."
		echo "Usage: mkcd directory"
	fi
}

# Renames the current working directory.
rn() {
	if [ $# == 1 ]; then
		CUR=$(basename $(pwd))
		cd ..
		mv $CUR $1
		cd $1
	else
		echo "rn: Renames the current working directory."
		echo "Usage: rn target"
	fi
}

