class Toaiff < Formula
  desc "Convert lossless audio to AIFF on macOS without quality loss"
  homepage "https://github.com/jzstern/toaiff"
  url "https://github.com/jzstern/toaiff/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "61e4df0a7ace48ad7a6dc271446b9e059840c7a5ef8b71737fbbf3b1f0b28f89"
  license "MIT"

  depends_on "ffmpeg"
  depends_on :macos

  def install
    bin.install "bin/toaiff"
  end

  def caveats
    <<~EOS
      The CLI is installed. To add the Finder right-click Quick Action (one time):

        1. Download "→ aiff.shortcut" from the latest release and open it:
             https://github.com/jzstern/toaiff/releases/latest
           Click "Add Shortcut".
        2. Enable it:
             System Settings ▸ Login Items & Extensions ▸ Finder ▸ toggle "→ aiff" on.
        3. Right-click lossless files or a folder ▸ Quick Actions ▸ → aiff.
    EOS
  end

  test do
    assert_match "toaiff #{version}", shell_output("#{bin}/toaiff --version")
  end
end
