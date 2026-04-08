class KrateDev < Formula
  desc "CLI for the krate micro-VM platform (dev channel)"
  homepage "https://kannister.app"
  version "0.27.0-dev"
  license "Commercial"

  url "https://github.com/kannister-app/krate/releases/download/v0.27.0-dev/krate-dev-0.27.0-arm64-darwin.tar.gz"
  sha256 "1ef6653070cf472086a0d3727cdba07d84efbe48f254030607374c882f1c6d3e"

  depends_on :macos
  depends_on arch: :arm64

  conflicts_with "krate", because: "krate-dev and krate install the same binaries"

  def install
    bin.install "krate"
    bin.install "anvild"
  end

  def caveats
    <<~EOS
      DEV CHANNEL — points at auth.krate.sh (dev server)

      Test the install:
        krate run hello-krate

      Log in to your krate account:
        krate login

      Check configuration:
        krate info

      No manual daemon management required.
    EOS
  end
end
