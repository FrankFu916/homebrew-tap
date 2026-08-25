class Clipcrate < Formula
  desc "Terminal-first clipboard history manager"
  homepage "https://github.com/FrankFu916/clipcrate"
  url "https://github.com/FrankFu916/clipcrate/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "e9c3dc025dcd4b08be39f96a7796a7f57364bcc5a68348ccb1f6fd8c8a028676"
  license "MIT"
  head "https://github.com/FrankFu916/clipcrate.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clipcrate --version")
  end
end
