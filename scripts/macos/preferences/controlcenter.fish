#!/usr/bin/env fish

source ./utils/helpers.fish

# hides the wifi status icon from the menu bar
run_or_echo "defaults write com.apple.controlcenter 'NSStatusItem Visible WiFi' -bool false"


# ensures the focus modes status icon is always visible in the menu bar
run_or_echo "defaults write com.apple.controlcenter 'NSStatusItem Visible FocusModes' -bool true"
