#!/usr/bin/env bash

# Script for setting up a new Mac OS machine

# Apps to install without a cask:
# – Xcode

echo "Checking if Homebrew is already installed...";

# Checks if Homebrew is installed
# Credit: https://gist.github.com/codeinthehole/26b37efa67041e1307db
if test ! $(which brew); then
  echo "Installing Homebrew...";
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "Adding Homebrew to PATH..."
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/tommis/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew is already installed...";
fi

echo "Installing essential brews...";

# Install the essential brews
brew install git
brew install node
brew install npm
brew install yarn
brew install vim
brew install tig
brew install thefuck

echo "Installing essential casks...";

# Install essential casks
brew install --cask iterm2
brew install --cask firefox
brew install --cask figma
brew install --cask google-chrome
brew install --cask slack
brew install --cask spotify
brew install --cask visual-studio-code
brew install --cask docker
brew install --cask karabiner-elements

# Update and Upgrade
echo "Updating and upgrading Homebrew..."; echo;
yes | brew update
yes | brew upgrade

# Remove outdated versions from the cellar
brew cleanup

echo "Configuring Mac OS settings...";

# Require password as soon as screensaver or sleep mode starts
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Set a faster key repeat
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable "natural" scroll
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "All done here!"
