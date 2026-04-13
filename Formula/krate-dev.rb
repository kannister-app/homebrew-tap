class KrateDev < Formula
  desc "CLI for the krate micro-VM platform (dev channel)"
  homepage "https://kannister.app"
  version "0.31.0-dev"
  license "Commercial"

  url "https://github.com/kannister-app/krate/releases/download/v0.31.0-dev/krate-dev-0.31.0-arm64-darwin.tar.gz"
  sha256 "7a74a8445e3b51ada9f79b0bcbe981d08e51537c6103b764ab6c79915f01a22b"

  depends_on :macos
  depends_on arch: :arm64

  conflicts_with "krate", because: "krate-dev and krate install the same binaries"

  def install
    bin.install "krate"
    bin.install "krated"
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
