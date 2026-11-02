cask "bouncer-app" do
  version "0.5.1"
  sha256 "06899fbace1ec68f7d30084ec68d8dec07da7d5e507c26c64fa1a5eb9e6ccc88"

  url "https://github.com/griphaugland/bouncer/releases/download/v0.5.1/Bouncer-#{version}.app.zip"
  name "Bouncer"
  desc "Menu bar view of Bouncer's build queue and memory pressure"
  homepage "https://github.com/griphaugland/bouncer"

  depends_on formula: "griphaugland/tap/bouncer"
  depends_on macos: :sonoma

  app "Bouncer.app"

  uninstall quit: "com.bouncer.menubar"

  caveats <<~EOS
    The menu bar app shows the daemon installed by the bouncer formula. If you haven't yet:
      bouncer setup
  EOS
end
