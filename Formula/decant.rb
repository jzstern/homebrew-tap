class Decant < Formula
  desc "Convert audio to AIFF or CDJ-ready MP3 on macOS without quality loss"
  homepage "https://github.com/jzstern/decant"
  url "https://github.com/jzstern/decant/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "f3d546ff4d6141a0699d80f82e32699ba741b3e13c0c6c1a17427c03995f4bfc"
  license "MIT"

  depends_on "ffmpeg"
  depends_on macos: :ventura

  def install
    bin.install "bin/decant"
    (pkgshare/"quickaction").install "quickaction/Decant.workflow"
  end

  def caveats
    <<~EOS
      The CLI is installed. Homebrew's build sandbox only allows a formula to
      write inside its own prefix, so the Finder Quick Action can't be dropped
      into ~/Library/Services automatically — add it with (one time):

        rm -rf ~/Library/Services/Decant.workflow
        cp -R #{opt_pkgshare}/quickaction/Decant.workflow ~/Library/Services/
        /System/Library/CoreServices/pbs -update

      Then enable it:
        System Settings ▸ Login Items & Extensions ▸ Finder ▸ toggle "Decant" on.
      Right-click audio files or a folder ▸ Quick Actions ▸ Decant.
    EOS
  end

  test do
    assert_match "decant #{version}", shell_output("#{bin}/decant --version")

    workflow = pkgshare/"quickaction/Decant.workflow"
    assert_path_exists workflow/"Contents/Info.plist"
    assert_path_exists workflow/"Contents/document.wflow"
  end
end
