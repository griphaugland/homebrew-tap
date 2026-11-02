class Bouncer < Formula
  desc "Queue heavy builds by memory pressure so many AI coding agents can share one Mac"
  homepage "https://github.com/griphaugland/bouncer"
  version "0.5.1"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/griphaugland/bouncer/releases/download/v0.5.1/bouncer-0.5.1-darwin-arm64.tar.gz"
      sha256 "fd0996108c509c62fbac9d2a85d2b5615eb7e4505438cbcd971bc559fa65c41a"
    end
    on_intel do
      url "https://github.com/griphaugland/bouncer/releases/download/v0.5.1/bouncer-0.5.1-darwin-x64.tar.gz"
      sha256 "79ff85766f842eafac3c88c21ffc413c984e631cacd1431d71a0b053dadf443c"
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
