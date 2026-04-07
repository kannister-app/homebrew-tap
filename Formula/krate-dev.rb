class KrateDev < Formula
  desc "CLI for the krate micro-VM platform (dev channel)"
  homepage "https://kannister.app"
  version "0.26.0-dev"
  license "Commercial"

  url "https://github.com/kannister-app/krate/releases/download/v0.26.0-dev/krate-dev-0.26.0-arm64-darwin.tar.gz"
  sha256 "fde9679eb3ead09a5ba2bffb83f0fce1da1f0d83a73ddb216056ea2152459937"

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
