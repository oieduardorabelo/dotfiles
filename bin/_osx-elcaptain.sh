#!/bin/bash

_osxDefaults() {
  # Disable animations when opening and closing windows
  defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

  # Disable animations when opening a Quick Look window
  defaults write -g QLPanelAnimationDuration -float 0

  # Accelerated playback when adjusting the window size (Cocoa applications)
  defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

  # Disable animation when opening the Info window in OS X Finder
  defaults write com.apple.finder DisableAllAnimations -bool true

  # Disable animations when you open an application from the Dock
  defaults write com.apple.dock launchanim -bool false

  # Make all animations faster that are used by Mission Control
  defaults write com.apple.dock expose-animation-duration -float 0.1

  # Dock auto hide
  defaults write com.apple.Dock autohide -float 1

  # Disable the delay when you hide the Dock
  defaults write com.apple.Dock autohide-delay -float 0

  # Icon Dock size
  defaults write com.apple.Dock tilesize -float 32

  # The keyboard react faster to keystrokes
  defaults write NSGlobalDomain KeyRepeat -int 0

  # Re-enable the repeat key feature
  defaults write -g ApplePressAndHoldEnabled -bool false

  # Disable full screen animation
  defaults write -g NSWindowResizeTime -float 0.001

  # Screenshots without window shadows
  defaults write com.apple.screencapture disable-shadow -bool true

  # Display the file extensions
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  # Show hidden files
  defaults write com.apple.Finder AppleShowAllFiles -bool true

  ##########
  # MAIL
  ##########

  # Disable the animation when you sending and replying an e-mail
  defaults write com.apple.mail DisableReplyAnimations -bool true
  defaults write com.apple.mail DisableSendAnimations -bool true

  ##########
  # SAFARI
  ##########
  defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25
}

info() {
  printf "  [ \033[00;34m..\033[0m ] %s " "$1"
}

success() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$1"
  echo ''
}

echo ''
info ' Applying OSX El Captain defaults...'
echo ''
_osxDefaults
success ' OSX El Captain defaults applied!'
