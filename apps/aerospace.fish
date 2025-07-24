#!/usr/bin/env fish

set platform $argv[1]
set app "aerospace"

source ./utils/helpers.fish

if is_gui_app_installed "AeroSpace"
    echo "AeroSpace is already installed, skipping."
    exit 0
end

switch $platform
    case macos
        run_or_echo "brew install --cask nikitabobko/tap/$app"
    case '*'
        echo "Unsupported platform: $platform for $app"
        exit 1
end