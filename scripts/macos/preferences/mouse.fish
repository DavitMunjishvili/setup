#!/usr/bin/env fish

source ./utils/helpers.fish

# natural scrolling
run_or_echo "defaults write -g com.apple.swipescrolldirection -bool false"


# disables the two-finger swipe gesture to navigate back and forward
run_or_echo "defaults write -g AppleEnableSwipeNavigateWithScrolls -bool false"


# mouse speed
run_or_echo "defaults write -g com.apple.mouse.scaling -float 3"


# this enables "tap to click"
run_or_echo "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true"


# allowing to click/tap with two fingers to simulate a right-click
run_or_echo "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true"


# app expose
run_or_echo "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2"


# enables the right-click on magic mouse
run_or_echo "defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string 'TwoButton'"


# enables double-click to open mission control on magic mouse
run_or_echo "defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseTwoFingerDoubleTapGesture -int 3"
