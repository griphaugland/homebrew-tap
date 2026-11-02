cask "bouncer" do
  version "0.5.0"
  sha256 "7cdf0d40a6d008916488d25e6fe39a8dd3de77696a56b33f1d523080d8305b00"

  url "https://github.com/griphaugland/bouncer/releases/download/v0.5.0/Bouncer-#{version}.app.zip"
  name "Bouncer"
  desc "Menu bar view of Bouncer's build queue and memory pressure"
  homepage "https://github.com/griphaugland/bouncer"

  depends_on formula: "griphaugland/tap/bouncer"
  depends_on macos: :sonoma

  app "Bouncer.app"

  uninstall quit: "com.bouncer.menubar"

  caveats <<~EOS
    The menu bar app shows the daemon installed by the bouncer formula. If you haven't yet:
      bouncer install
  EOS
end
