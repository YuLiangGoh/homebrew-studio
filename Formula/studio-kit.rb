# typed: strict
# frozen_string_literal: true

# Homebrew formula for the studio kit launcher. Lives in the tap repo YuLiangGoh/homebrew-studio as
# Formula/studio-kit.rb (not "sk": homebrew-core's sk is skim, a fuzzy finder);
# this copy is the source. A release: tag the toolkit (vX.Y.Z), set tag + revision below, copy into the tap.
class StudioKit < Formula
  desc "Local songs, 3D layouts, anime paintings and looping videos on Apple Silicon"
  homepage "https://github.com/YuLiangGoh/studio-toolkit"
  url "https://github.com/YuLiangGoh/studio-toolkit.git",
      tag:      "v0.2.0",
      revision: "2b6a70e74ac255eb4b2c377bad812bfe17739fbe"
  license "MIT"
  head "https://github.com/YuLiangGoh/studio-toolkit.git", branch: "main"

  depends_on arch: :arm64
  depends_on "ffmpeg"
  depends_on :macos
  depends_on "uv"

  conflicts_with "sk", because: "both install an `sk` binary (homebrew-core's sk is skim)"

  def install
    # only the launcher: on first run it puts the toolkit in ~/studio/toolkit (Claude Code reads the skills there)
    bin.install "packaging/sk-launcher" => "sk"
  end

  def caveats
    <<~EOS
      Run `sk` once: it installs the studio kit into ~/studio/toolkit and checks this Mac.
      It asks before downloading any model. Later, `sk update` gets new versions.
    EOS
  end

  test do
    assert_match "sk launcher", shell_output("#{bin}/sk --launcher-version")
  end
end
