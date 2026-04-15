class KrateDev < Formula
  desc "CLI for the krate micro-VM platform (dev channel)"
  homepage "https://kannister.app"
  version "0.34.1-dev"
  license "Commercial"

  url "https://github.com/kannister-app/krate/releases/download/v0.34.1-dev/krate-dev-0.34.1-arm64-darwin.tar.gz"
  sha256 "1278bbe69fd636c34fe84e6b32a1d0bbe3e1006a29311f9ac1fe5f02556e7f1b"

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
