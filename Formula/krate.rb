class Krate < Formula
  desc "Micro-VM engine for developer workload isolation"
  homepage "https://kannister.app"
  version "0.14.0"
  license "Commercial"

  url "https://github.com/kannister-app/krate-vm-engine/archive/refs/tags/v0.14.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

  depends_on :macos
  depends_on arch: :arm64

  bottle do
    root_url "https://github.com/kannister-app/homebrew-tap/releases/download/v0.14.0"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "e4aa376304643d4c1a61e63f4e81305c683d022e1acb1801f7de2d5e9e98920f"
  end

  def install
    bin.install "krate"
    bin.install "anvild"
    (share/"krate").install "anvil-guest-init" if File.exist? "anvil-guest-init"
    (share/"krate").install "vmlinuz" if File.exist? "vmlinuz"
    (share/"krate").install "io.kannister.anvild.plist" if File.exist? "io.kannister.anvild.plist"
  end

  def caveats
    <<~EOS
      krate automatically starts anvild when needed — just run:
        krate run alpine:latest

      Start a dev environment (auto-detects docker-compose.yml):
        krate up

      Build from Dockerfile:
        krate build -f Dockerfile -t my-app:latest .

      No manual daemon management required.
    EOS
  end
end
