#!/usr/bin/env bash

# disable font smoothing
defaults -currentHost write -g AppleFontSmoothing -int 0
defaults write -g CGFontRenderingFontSmoothingDisabled -bool true

# show mail attachments as icons
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true
