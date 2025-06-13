#!/usr/bin/env fish

set platform $argv[1]

if test -z "$platform"
    echo "[E] No platform passed to linux/main.fish"
    exit 1
end

echo "[I] Running Linux setup for: $platform"

# Load shared helper functions
source ./utils/helpers.fish

# Run all app install scripts
for app_script in (ls ./apps/*.fish)
    echo "--- Running $app_script ---"
    fish $app_script $platform
end
