#!/usr/bin/env fish

echo "running macos-specific setup..."

echo "--- Settings macos preferences ---"
for preference_script in (ls ./scripts/macos/preferences/*.fish)
    echo "--- Running $preference_script ---"
    fish $preference_script
end


if not type brew > /dev/null
    echo "--- Installing Homebrew ---"
    run_or_echo "/bin/bash -c '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)'"
else
    echo "--- Homebrew is already installed ---"
end



if not type git > /dev/null
    echo "--- Installing Git ---"
    run_or_echo "brew install git"
else
    echo "--- Git is already installed ---"
end


echo "--- Installing apps ---"
for app_script in (ls ./apps/*.fish)
    echo "--- Running $app_script ---"
    fish $app_script macos
end
