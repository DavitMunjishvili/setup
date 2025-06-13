#!/usr/bin/env fish

source ./utils/helpers.fish

# changes the behavior of double-clicking a window's title bar to maximize the window instead of minimizing it
run_or_echo "defaults write -g AppleActionOnDoubleClick -string 'Maximize'"


# sets the system appearance to dark mode
run_or_echo "defaults write -g AppleInterfaceStyle -string 'Dark'"


# prevents macos from automatically switching to a space containing an application's open windows when you switch to that app.
run_or_echo "defaults write -g AppleSpacesSwitchOnActivate -bool false"
