class KrateDev < Formula
  desc "CLI for the krate micro-VM platform (dev channel)"
  homepage "https://kannister.app"
  version "0.28.1-dev"
  license "Commercial"

  url "https://github.com/kannister-app/krate/releases/download/v0.28.1-dev/krate-dev-0.28.1-arm64-darwin.tar.gz"
  sha256 "b834626194a77764b2766275590b441ad64a5dc2a1c8f42dcc0dedc700394666"

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
