#!/usr/bin/env fish

set platform $argv[1]
set app "ripgrep"

source ./utils/helpers.fish

if is_installed rg $platform
    echo "$app is already installed, skipping."
    exit 0
end

switch $platform
    case macos
        run_or_echo "brew install $app"
    case arch
        run_or_echo "sudo pacman -S $app"
    case debian
        run_or_echo "sudo apt install $app"
    case fedora
        run_or_echo "sudo dnf install $app"
    case '*'
        echo "Unsupported platform: $platform for $app"
        exit 1
end
