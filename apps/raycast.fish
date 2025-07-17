#!/usr/bin/env fish

set platform $argv[1]
set app "raycast"

source ./utils/helpers.fish

if test -d /Applications/Raycast.app/
    echo "Raycast is already installed in /Applications, skipping."
    exit 0
end


if is_installed $app $platform
    echo "$app is already installed, skipping."
    exit 0
end

switch $platform
    case macos
        run_or_echo "brew install $app"
    case '*'
        echo "Unsupported platform: $platform for $app"
        exit 1
end
