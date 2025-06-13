#!/usr/bin/env fish

set platform $argv[1]
set app "yt-dlp"

source ./utils/helpers.fish

if is_installed $app $platform
    echo "$app is already installed, skipping."
    exit 0
end

switch $platform
    case macos
        run_or_echo "brew install $app"
    case arch
        run_or_echo "sudo pacman -Syu $app"
    case debian
        run_or_echo "sudo apt install $app"
    case '*'
        echo "Unsupported platform: $platform for $app"
        exit 1
end
