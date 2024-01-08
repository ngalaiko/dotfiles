#!/usr/bin/env bash

# disable font smoothing
defaults -currentHost write -g AppleFontSmoothing -int 0
defaults write -g CGFontRenderingFontSmoothingDisabled -bool true

# show mail attachments as icons
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# ddisable sonoma language switch bubble
defaults write /Library/Preferences/FeatureFlags/Domain/UIKit.plist redesigned_text_cursor -dict-add Enabled -bool NO
