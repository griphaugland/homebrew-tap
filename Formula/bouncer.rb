class Bouncer < Formula
  desc "Queue heavy builds by memory pressure so many AI coding agents can share one Mac"
  homepage "https://github.com/griphaugland/bouncer"
  version "0.5.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/griphaugland/bouncer/releases/download/v0.5.0/bouncer-0.5.0-darwin-arm64.tar.gz"
      sha256 "f1a07624a8b57f64ff13ee6572dc0c5866e55c09ee263b0dd26011f975249a2d"
    end
    on_intel do
      url "https://github.com/griphaugland/bouncer/releases/download/v0.5.0/bouncer-0.5.0-darwin-x64.tar.gz"
      sha256 "150b24893152b4c9bead495aad262bf8dfa715a77e9d1b967f20fd24ed396e44"
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
