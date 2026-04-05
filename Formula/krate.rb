class Krate < Formula
  desc "Micro-VM engine for developer workload isolation"
  homepage "https://kannister.app"
  version "0.17.0"
  license "Commercial"

  url "https://github.com/kannister-app/krate-vm-engine/releases/download/v0.17.0/krate-0.17.0-arm64-darwin.tar.gz"
  sha256 "d147b2f05fdbc01110f7300cc3f837be4e9e7ffd2deeef7c72f1df423670b1ed"

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
