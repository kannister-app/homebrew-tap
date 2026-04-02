class Krate < Formula
  desc "Micro-VM engine for developer workload isolation"
  homepage "https://kannister.app"
  version "0.13.0"
  license "Commercial"

  url "https://github.com/kannister-app/krate-vm-engine/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

  depends_on :macos
  depends_on arch: :arm64

  bottle do
    root_url "https://github.com/kannister-app/homebrew-tap/releases/download/v0.13.0"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "372adaaf5dcc759f2822e8d216ec0f8a33c635b7b8a9b559cb55b37ca3459503"
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

      Build from Dockerfile (requires Docker for build, not for run):
        krate build -f Dockerfile -t my-app:latest .
        krate run my-app:latest

      No manual daemon management required.
    EOS
  end
end
