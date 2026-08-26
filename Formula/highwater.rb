class Highwater < Formula
  desc "Self-hosted data freshness & quality monitoring — know when your data stops flowing"
  homepage "https://github.com/FrankFu916/highwater"
  url "https://registry.npmjs.org/highwater/-/highwater-0.1.0.tgz"
  sha256 "f48af08c70a1a6f7603ec39fec45fbd0e51ba6a4cd68806a81403670a3be375a"
  license "MIT"

  depends_on "node" => ">=22.5.0"

  # Note: Homebrew applies a --min-release-age cooldown (currently 1 day) to npm
  # installs as a supply-chain protection. Freshly published versions become
  # installable via brew after that window; `npm i -g highwater` works instantly.

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/highwater")
  end

  test do
    assert_match "know when your data stops flowing", shell_output("#{bin}/highwater --help")
    assert_match version.to_s, shell_output("#{bin}/highwater version")
  end
end
