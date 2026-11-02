cask "bouncer-app" do
  version "0.5.2"
  sha256 "a835d13897afbe49c024458f9b5ef0d146770f040ce626e83a1f7062845ddfc5"

  url "https://github.com/griphaugland/bouncer/releases/download/v0.5.2/Bouncer-#{version}.app.zip"
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
