#!/usr/bin/env fish

set platform $argv[1]
set app "raycast"

source ./utils/helpers.fish

if is_gui_app_installed "Raycast"
    echo "Raycast is already installed, skipping."
    exit 0
end

switch $platform
    case macos
        run_or_echo "brew install $app"
    case '*'
        echo "Unsupported platform: $platform for $app"
        exit 1
end