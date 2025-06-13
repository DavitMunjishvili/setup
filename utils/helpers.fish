#!/usr/bin/env fish

function run_or_echo
    if test "$DRY_RUN" -eq 1
        echo "Would run: $argv"
    else
        eval $argv
    end
end

function is_installed --argument-names app platform
    switch $platform
        case macos
            command -v $app > /dev/null
        case arch
            pacman -Qi $app > /dev/null
        case debian
            dpkg -l | grep -q "^ii  $app "
        case fedora
            rpm -q $app > /dev/null
        case '*'
            return 1
    end
end
