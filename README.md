# homebrew-windowswitch

Homebrew tap for [WindowSwitch](https://github.com/sanjay7178/WindowsSwitch), a macOS menu bar HUD for ⌘`.

This is a **personal tap**, not part of `homebrew/cask`. The GitHub Release DMG is not Apple Developer ID signed, so official Homebrew will not accept it.

## Install

Apple Silicon, macOS 14+:

```sh
brew tap sanjay7178/windowswitch
brew install --cask windowswitch
xattr -dr com.apple.quarantine /Applications/WindowSwitch.app
open /Applications/WindowSwitch.app
```

Then enable **Accessibility** and **Input Monitoring** in System Settings.

## Update the cask after a release

From the [WindowsSwitch](https://github.com/sanjay7178/WindowsSwitch) repo:

```sh
VERSION=x.y.z Scripts/update-cask.sh
```

Copy the updated `Casks/windowswitch.rb` into this tap and push.
