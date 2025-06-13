#!/usr/bin/env fish

set platform $argv[1]
set app "fastfetch"

source ./utils/helpers.fish

if is_installed $app $platform
    echo "$app is already installed, skipping."
    exit 0
end

switch $platform
    case macos
        run_or_echo "brew install $app"
    case fedora
        run_or_echo "sudo dnf install $app"
    case debian
        run_or_echo "sudo apt install $app"
    case '*'
        echo "Unsupported platform: $platform for $app"
        exit 1
end
