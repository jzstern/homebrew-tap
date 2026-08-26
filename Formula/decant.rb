class Decant < Formula
  desc "Convert audio to AIFF or CDJ-ready MP3 on macOS without quality loss"
  homepage "https://github.com/jzstern/decant"
  url "https://github.com/jzstern/decant/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "61929b6e41e692a1310d94e89828a40a01df8b5d954600ff4d6b004253bebd86"
  license "MIT"

  depends_on "ffmpeg"
  depends_on :macos

  def install
    bin.install "bin/decant"
  end

  def caveats
    <<~EOS
      The CLI is installed. To add the Finder right-click Quick Action (one time):

        1. Download "Decant.shortcut" from the latest release and open it:
             https://github.com/jzstern/decant/releases/latest
           Click "Add Shortcut".
        2. Enable it:
             System Settings ▸ Login Items & Extensions ▸ Finder ▸ toggle "Decant" on.
        3. Right-click audio files or a folder ▸ Quick Actions ▸ Decant.
    EOS
  end

  test do
    assert_match "decant #{version}", shell_output("#{bin}/decant --version")
  end
end
