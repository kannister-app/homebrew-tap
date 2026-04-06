class Krate < Formula
  desc "CLI for the krate micro-VM platform"
  homepage "https://kannister.app"
  version "0.18.0"
  license "Commercial"

  url "https://github.com/kannister-app/krate/releases/download/v0.18.0/krate-0.18.0-arm64-darwin.tar.gz"
  sha256 "bd220e11faea262f85af374a2f6c583327cc14f9ec466700bf01d01866b3e73c"

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
