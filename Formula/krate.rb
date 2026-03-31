class Krate < Formula
  desc "Micro-VM engine for developer workload isolation"
  homepage "https://kannister.app"
  version "0.10.0"
  license "Commercial"

  url "https://github.com/kannister-app/krate-vm-engine/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

  depends_on :macos
  depends_on arch: :arm64

  bottle do
    root_url "https://github.com/kannister-app/homebrew-tap/releases/download/v0.10.0"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "f0fcc30618ff9225a9aa7d9190cfa56bc1db91439b69dd40e2ccfe597ec27eee"
  end

  def install
    bin.install "krate"
    bin.install "anvild"
    (share/"krate").install "io.kannister.anvild.plist" if File.exist? "io.kannister.anvild.plist"
  end

  service do
    run [opt_bin/"anvild"]
    keep_alive true
    log_path var/"log/krate/anvild.log"
    error_log_path var/"log/krate/anvild-error.log"
    environment_variables PATH: "/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
  end

  def caveats
    <<~EOS
      To start anvild now and auto-start on login:
        brew services start krate

      Note: `brew upgrade krate` restarts anvild and stops running workloads.

      To build custom kernels or workloads (requires Docker):
        krate build --spec minimal-linux/6.6.30
    EOS
  end
end
