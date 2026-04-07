class KrateDev < Formula
  desc "CLI for the krate micro-VM platform (dev channel)"
  homepage "https://kannister.app"
  version "0.22.0-dev"
  license "Commercial"

  url "https://github.com/kannister-app/krate/releases/download/v0.22.0-dev/krate-dev-0.22.0-arm64-darwin.tar.gz"
  sha256 "c908347e09e52a5012e8a4f7eec44edbfff46c2931c45cff4077b50d1e5b2184"

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
