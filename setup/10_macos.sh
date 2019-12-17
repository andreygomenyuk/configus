
set -x

# Disable auto capitalisation, smart dashes, period substitution, smart quotes,
# auto correction
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Localisation
defaults write NSGlobalDomain AppleLanguages -array "en-GB" "ru" "en"
defaults write NSGlobalDomain AppleLocale -string "en_GB"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Top Right Menu
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM  HH:mm:ss"
defaults write com.apple.menuextra.clock IsAnalog -bool false
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false
defaults write com.apple.menuextra.battery ShowPercent -bool true
defaults write com.apple.systemuiserver menuExtras -array \
    "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
    "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
    "/System/Library/CoreServices/Menu Extras/Battery.menu" \
    "/System/Library/CoreServices/Menu Extras/Volume.menu" \
    "/System/Library/CoreServices/Menu Extras/User.menu" \
    "/System/Library/CoreServices/Menu Extras/Clock.menu"\
    "/System/Library/CoreServices/Menu Extras/vpn.menu"
defaults write com.apple.networkConnect VPNShowTime -bool True

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save PNG screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"
defaults write com.apple.screencapture type -string "png"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Finder: show hidden files, extensions, status bar, path in title, folders
# firsrt, search in the current folder, use list view by default
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode TwoButton
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Dock preferences
defaults write com.apple.dock tilesize -int 36
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock show-process-indicators -bool true
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others

# TextEdit
defaults write com.apple.TextEdit RichText -int 0
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Termial
defaults write com.apple.Terminal.plist "Default Window Settings" "Pro"
defaults write com.apple.Terminal.plist "Startup Window Settings" "Pro"
defaults write com.apple.terminal StringEncodings -array 4
/usr/libexec/PlistBuddy -c "Add :'Window Settings':Pro:rowCount integer 50" ~/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Add :'Window Settings':Pro:columnCount integer 150" ~/Library/Preferences/com.apple.Terminal.plist

killall Dock
killall Finder
killall SystemUIServer -HUP

