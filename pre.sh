#!/bin/bash

# Check if fish is installed
if ! command -v fish >/dev/null 2>&1; then
	echo "Fish shell not found. Attempting to install..."

	# Detect OS
	OS="$(uname)"
	if [[ "$OS" == "Darwin" ]]; then
		echo "Detected macOS."
		if ! command -v brew >/dev/null 2>&1; then
			echo "Homebrew not found. Please install Homebrew first: https://brew.sh"
			exit 1
		fi
		brew install fish
	elif [[ "$OS" == "Linux" ]]; then
		echo "Detected Linux."

		# Try ubuntu, fedora, or arch
		if command -v apt >/dev/null 2>&1; then
			sudo apt update && sudo apt install -y fish
		elif command -v dnf >/dev/null 2>&1; then
			sudo dnf install -y fish
		elif command -v pacman >/dev/null 2>&1; then
			sudo pacman -Sy fish
		else
			echo "Unsupported package manager. Install fish manually."
			exit 1
		fi
	else
		echo "Unsupported OS: $OS"
		exit 1
	fi
else
	echo "Fish is already installed."
fi

# Change default shell to fish (optional, requires password)
if [[ "$SHELL" != *fish ]]; then
	read -pr "Do you want to set fish as your default shell? (y/n): " answer
	if [[ "$answer" == "y" ]]; then
		FISH_PATH=$(command -v fish)
		if ! grep -q "$FISH_PATH" /etc/shells; then
			echo "Adding $FISH_PATH to /etc/shells"
			echo "$FISH_PATH" | sudo tee -a /etc/shells
		fi
		chsh -s "$FISH_PATH"
		echo "Default shell changed to fish. Restart terminal for changes to take effect."
	fi
fi

# Execute the main fish script, passing along any arguments
echo "[I] Handing over to run.fish..."
fish run.fish "$@"