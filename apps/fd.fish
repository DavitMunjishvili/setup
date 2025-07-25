#!/usr/bin/env fish

set platform $argv[1]
set app "fd"

source ./utils/helpers.fish

if is_installed $app $platform
    echo "$app is already installed, skipping."
    exit 0
end

if is_installed "$app-find" $platform
    echo "$app is already installed, skipping."
    exit 0
end

switch $platform
    case macos
        run_or_echo "brew install $app"
    case arch
        run_or_echo "yay -S $app --noconfirm"
    case debian
        run_or_echo "sudo apt install -y $app-find"
    case fedora
        run_or_echo "sudo dnf install -y $app-find"
    case '*'
        echo "Unsupported platform: $platform for $app"
        exit 1
end
