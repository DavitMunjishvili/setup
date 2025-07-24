#!/usr/bin/env fish

source ./utils/helpers.fish

# controls the visibility of the path bar at the bottom of finder windows
run_or_echo "defaults write com.apple.finder ShowPathbar -bool true"


# determines if icons for connected external drives are displayed on the desktop
run_or_echo "defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true"


# determines if icons for removable media are displayed on the desktop
run_or_echo "defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true"


# sets the default location for new finder windows
# PfHm stands for "Home folder"
run_or_echo "defaults write com.apple.finder NewWindowTarget -string 'PfHm'"


# sets the default view for any new finder window that doesn't have its own saved view setting
# the code 'Nlsv' stands for list view.
run_or_echo "defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'"
