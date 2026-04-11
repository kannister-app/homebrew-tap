class KrateDev < Formula
  desc "CLI for the krate micro-VM platform (dev channel)"
  homepage "https://kannister.app"
  version "0.30.0-dev"
  license "Commercial"

  url "https://github.com/kannister-app/krate/releases/download/v0.30.0-dev/krate-dev-0.30.0-arm64-darwin.tar.gz"
  sha256 "20661fe761061b8a96cdf04c4ebb730be7abf7c0a1e285cd6babad56239ae76c"

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
