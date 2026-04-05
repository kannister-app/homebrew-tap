class Krate < Formula
  desc "CLI for the krate micro-VM platform"
  homepage "https://kannister.app"
  version "0.17.0"
  license "Commercial"

  url "https://github.com/kannister-app/krate/releases/download/v0.17.0/krate-0.17.0-arm64-darwin.tar.gz"
  sha256 "4ea1f0380f2fe07b08b55ed7f5dd65f44b58f6535cff670c9555378a88264737"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "krate"
    bin.install "anvild"
  end

  def caveats
    <<~EOS
      krate automatically starts anvild when needed — just run:
        krate run alpine:latest

      Log in to your krate account:
        krate login

      Start a dev environment (auto-detects docker-compose.yml):
        krate up

      Submit feedback:
        krate feedback "message"

      No manual daemon management required.
    EOS
  end
end
