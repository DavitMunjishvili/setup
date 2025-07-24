#!/usr/bin/env fish

set dry_run 0
set args

for arg in $argv
    if test $arg = "--dry-run"
        set dry_run 1
    else
        set args $args $arg
    end
end

set -gx DRY_RUN $dry_run

# Detect OS
set platform ""
switch (uname)
    case Darwin
        set platform "macos"
    case Linux
        if test -f /etc/os-release
            source /etc/os-release
            switch $ID
                case arch
                    set platform "arch"
                case ubuntu debian
                    set platform "debian"
                case fedora
                    set platform "fedora"
                case '*'
                    echo "[E] Unsupported Linux distro: $ID"
                    exit 1
            end
        else
            echo "[E] Unknown Linux distribution"
            exit 1
        end
    case '*'
        echo "[E] Unsupported OS: (uname)"
        exit 1
end

echo "[I] Detected platform: $platform"
if test "$DRY_RUN" -eq 1
    echo "[W] Running in DRY RUN mode — no commands will be executed"
end

# Run platform-specific setup
switch $platform
    case macos
        fish ./scripts/macos/main.fish $platform $args
    case arch debian fedora
        fish ./scripts/linux/main.fish $platform $args
end

echo "[I] Setup complete."