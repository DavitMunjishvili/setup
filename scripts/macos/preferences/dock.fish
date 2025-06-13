#!/usr/bin/env fish

source ./utils/helpers.fish

# automatically hide and show the dock
run_or_echo "defaults write com.apple.dock autohide -bool true"


# remove the delay before the dock appears
run_or_echo "defaults write com.apple.dock autohide-delay -float 0"


# remove the dock's hide/show animation
run_or_echo "defaults write com.apple.dock autohide-time-modifier -float 0"


# disable the bouncing animation for opening applications
run_or_echo "defaults write com.apple.dock launchanim -bool false"


# change the window minimization effect
run_or_echo "defaults write com.apple.dock mineffect -string 'scale'"


# hide the indicator dots for open applications
run_or_echo "defaults write com.apple.dock show-process-indicators -bool false"


# do not show recent applications in the dock
run_or_echo "defaults write com.apple.dock show-recents -bool false"


# set the icon size for items in the dock
run_or_echo "defaults write com.apple.dock tilesize -int 36"


# set the maximum magnification size of dock icons
run_or_echo "defaults write com.apple.dock largesize -int 16"


# remove all persistent application icons from the dock
run_or_echo "defaults write com.apple.dock persistent-apps -array"


# remove all persistent folder/file icons from the dock
run_or_echo "defaults write com.apple.dock persistent-others -array"


# disable rearranging spaces based on recent use
run_or_echo "defaults write com.apple.dock mru-spaces -bool false"


# disable entering mission control by dragging a window to the top of the screen
run_or_echo "defaults write com.apple.dock enterMissionControlByTopWindowDrag -bool false"


# disable the hot corners for the bottom-left and bottom-right of the screen
run_or_echo "defaults write com.apple.dock wvous-bl-corner -int 1 && defaults write com.apple.dock wvous-br-corner -int 1"


# Apply the changes
run_or_echo "killall Dock"
