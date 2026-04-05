class Krate < Formula
  desc "CLI for the krate micro-VM platform"
  homepage "https://kannister.app"
  version "0.17.0"
  license "Commercial"

  url "https://github.com/kannister-app/krate/releases/download/v0.17.0/krate-0.17.0-arm64-darwin.tar.gz"
  sha256 "c8e16c9f3f1640e635959ea4a2ab3c7b6c3e0176edd33fba57e1552023c2eecd"

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
