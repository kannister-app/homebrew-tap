class Krate < Formula
  desc "Micro-VM engine for developer workload isolation"
  homepage "https://kannister.app"
  version "0.11.0"
  license "Commercial"

  url "https://github.com/kannister-app/krate-vm-engine/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

  depends_on :macos
  depends_on arch: :arm64

  bottle do
    root_url "https://github.com/kannister-app/homebrew-tap/releases/download/v0.11.0"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "5789f15f7abc7c71553687a6e2cade28ade688224fd591db2ae1e151618e5cd0"
  end

  def install
    bin.install "krate"
    bin.install "anvild"
    (share/"krate").install "anvil-guest-init" if File.exist? "anvil-guest-init"
    (share/"krate").install "vmlinuz" if File.exist? "vmlinuz"
    (share/"krate").install "io.kannister.anvild.plist" if File.exist? "io.kannister.anvild.plist"
  end

  service do
    run [opt_bin/"anvild"]
    keep_alive true
    log_path var/"log/krate/anvild.log"
    error_log_path var/"log/krate/anvild-error.log"
    environment_variables PATH: "/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin",
                          ANVIL_KERNEL_PATH: "#{HOMEBREW_PREFIX}/share/krate/vmlinuz",
                          ANVIL_INIT_PATH: "#{HOMEBREW_PREFIX}/share/krate/anvil-guest-init"
  end

  def caveats
    <<~EOS
      To start anvild now and auto-start on login:
        brew services start krate

      Note: `brew upgrade krate` restarts anvild and stops running workloads.
    EOS
  end
end
