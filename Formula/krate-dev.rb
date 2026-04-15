class KrateDev < Formula
  desc "CLI for the krate micro-VM platform (dev channel)"
  homepage "https://kannister.app"
  version "0.34.3-dev"
  license "Commercial"

  url "https://github.com/kannister-app/krate/releases/download/v0.34.3-dev/krate-dev-0.34.3-arm64-darwin.tar.gz"
  sha256 "f31251b09bb6c0fedbcf824505e5bf2440c7db3025b54b3431df9b04dfc08638"

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
