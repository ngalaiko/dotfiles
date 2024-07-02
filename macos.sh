#!/usr/bin/env bash

# disable font smoothing
defaults -currentHost write -g AppleFontSmoothing -int 0
defaults write -g CGFontRenderingFontSmoothingDisabled -bool true

# show mail attachments as icons
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# disable sonoma language switch bubble
defaults write /Library/Preferences/FeatureFlags/Domain/UIKit.plist redesigned_text_cursor -dict-add Enabled -bool NO

# do not launch Music.app when play is pressed
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Restart the Dock
killall Dock

# Restart finder
killall Finder

# Restart SystemUIServer
killall SystemUIServer
