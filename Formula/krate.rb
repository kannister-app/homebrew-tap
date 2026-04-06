class Krate < Formula
  desc "CLI for the krate micro-VM platform"
  homepage "https://kannister.app"
  version "0.18.0"
  license "Commercial"

  url "https://github.com/kannister-app/krate/releases/download/v0.18.0/krate-0.18.0-arm64-darwin.tar.gz"
  sha256 "0b0e14a19cead850480b1f772cc8dc74e5e52a5171fcc266cbddfa07268366b7"

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
