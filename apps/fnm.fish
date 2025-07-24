#!/usr/bin/env fish

set platform $argv[1]
set app "fnm"

source ./utils/helpers.fish

if is_installed $app $platform
    echo "$app is already installed, skipping."
    exit 0
end

switch $platform
    case macos
        run_or_echo "brew install $app"
    case arch debian fedora
        run_or_echo "curl -fsSL https://fnm.vercel.app/install | fish"
    case '*'
        echo "Unsupported platform: $platform for $app"
        exit 1
end