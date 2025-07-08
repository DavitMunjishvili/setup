#!/usr/bin/env fish

set platform $argv[1]
set app "cargo"

source ./utils/helpers.fish

if is_installed $app $platform
    echo "$app is already installed, skipping."
    exit 0
end

run_or_echo "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
