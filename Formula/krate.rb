class Krate < Formula
  desc "Micro-VM engine for developer workload isolation"
  homepage "https://kannister.app"
  version "0.12.0"
  license "Commercial"

  url "https://github.com/kannister-app/krate-vm-engine/archive/refs/tags/v0.12.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

  depends_on :macos
  depends_on arch: :arm64

  bottle do
    root_url "https://github.com/kannister-app/homebrew-tap/releases/download/v0.12.0"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "e709379f7c41d09589611b86a510a2a00a59dce8bbbba47e4372586fe7e7f5bf"
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

      No manual daemon management required.
    EOS
  end
end
