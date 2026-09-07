cask "windowswitch" do
  version "1.0.0"
  sha256 "0d60a20901cd82b2dd5d47a33c0159d38ce4bc1176e11f336649cfe3fe4e81d1"

  url "https://github.com/sanjay7178/WindowsSwitch/releases/download/v#{version}/WindowSwitch-#{version}.dmg",
      verified: "github.com/sanjay7178/WindowsSwitch/"
  name "WindowSwitch"
  desc "HUD for switching windows of the current app with Command-backtick"
  homepage "https://github.com/sanjay7178/WindowsSwitch"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  # GitHub Actions macos-15 builds are Apple Silicon.
  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "WindowSwitch.app"

  uninstall quit: "app.windowswitch.WindowSwitch"

  zap trash: [
    "~/Library/LaunchAgents/app.windowswitch.WindowSwitch.plist",
    "~/Library/Preferences/app.windowswitch.WindowSwitch.plist",
  ]

  caveats <<~EOS
    WindowSwitch is not signed with an Apple Developer ID. Homebrew still
    quarantines the download, so macOS will block the first launch.

    After installing:

      xattr -dr com.apple.quarantine /Applications/WindowSwitch.app
      open /Applications/WindowSwitch.app

    Then enable Accessibility and Input Monitoring in System Settings.

    Official homebrew/cask does not accept unsigned apps. Install from this
    tap (sanjay7178/windowswitch), not from Homebrew core.
  EOS
end
