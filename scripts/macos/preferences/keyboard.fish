#!/usr/bin/env fish

source ./utils/helpers.fish

# disable `fn` extra functionality
run_or_echo "defaults write com.apple.HIToolbox AppleFnUsageType -int 0"


# this command completely replaces the existing input sources
run_or_echo "defaults write com.apple.HIToolbox AppleEnabledInputSources -array \
  '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>0</integer><key>KeyboardLayout Name</key><string>U.S.</string></dict>' \
  '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>-27650</integer><key>KeyboardLayout Name</key><string>Georgian-QWERTY</string></dict>'"


# disables the press-and-hold feature
run_or_echo "defaults write -g ApplePressAndHoldEnabled -bool false"


# key repeat and delay
run_or_echo "defaults write -g InitialKeyRepeat -int 12 && defaults write -g KeyRepeat -int 2"



# disables all of the automatic text correction and substitution features for a more literal typing experience
run_or_echo "defaults write -g NSAutomaticCapitalizationEnabled -bool false"
run_or_echo "defaults write -g NSAutomaticDashSubstitutionEnabled -bool false"
run_or_echo "defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false"
run_or_echo "defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false"
run_or_echo "defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false"
