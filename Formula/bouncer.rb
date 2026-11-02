class Bouncer < Formula
  desc "Queue heavy builds by memory pressure so many AI coding agents can share one Mac"
  homepage "https://github.com/griphaugland/bouncer"
  version "0.5.2"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/griphaugland/bouncer/releases/download/v0.5.2/bouncer-0.5.2-darwin-arm64.tar.gz"
      sha256 "ea260e8c56f538ed5984e29061967749f8cb5cfe17dbf84336bb0fac534dc009"
    end
    on_intel do
      url "https://github.com/griphaugland/bouncer/releases/download/v0.5.2/bouncer-0.5.2-darwin-x64.tar.gz"
      sha256 "cec240794a75f681ff77d0e55aac9de393dba0ab27de47c632658bf661082db7"
    end
  end

  def install
    bin.install "bouncer"
  end

  def caveats
    <<~EOS
      Finish setup (daemon, shims, Claude Code hooks):
        bouncer install

      Upgrades apply on their own: the daemon restarts onto the new version once no build is running.
      Remove everything with `bouncer uninstall` before `brew uninstall bouncer`.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/bouncer --version").strip
    assert_match "bouncer", shell_output("#{bin}/bouncer help")
  end
end
