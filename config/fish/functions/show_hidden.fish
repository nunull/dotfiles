# Shows or hides hidden files in the Finder.
# Expects YES or NO as it's first parameter.
function show_hidden
	defaults write com.apple.finder AppleShowAllFiles $argv
	killall Finder
end
