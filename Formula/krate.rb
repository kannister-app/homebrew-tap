class Krate < Formula
  desc "CLI for the krate micro-VM platform"
  homepage "https://kannister.app"
  version "0.19.0"
  license "Commercial"

  url "https://github.com/kannister-app/krate/releases/download/v0.19.0/krate-0.19.0-arm64-darwin.tar.gz"
  sha256 "3c655d1b3455ca309936c397108e938bd35a56a751bbe22f7fa9a33e82697b31"

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
