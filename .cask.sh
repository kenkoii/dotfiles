#!/usr/bin/env bash

# Make sure we update homebrew
brew update

# Upgrade necessary tools
brew upgrade

# Development
brew cask install docker

# Browsers
brew cask install firefox
brew cask install google-chrome
brew cask install brave-browser

# Install utils app
brew cask install insomnia
brew cask install sequel-pro

# Install productivity
brew cask install slack
brew cask install spotify

# Others
brew cask install transmission
brew cask install iina
brew cask install caprine

# Utils 
brew install hub

# Remove outdated versions from the cellar.
brew cleanup