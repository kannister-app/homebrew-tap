class Krate < Formula
  desc "Micro-VM engine for developer workload isolation"
  homepage "https://kannister.app"
  version "0.10.0"
  license "Commercial"

  url "https://github.com/kannister-app/krate-vm-engine/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  depends_on :macos
  depends_on arch: :arm64

  bottle do
    root_url "file:///tmp"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "ad199c36a3bb4895b06f3343a98253c066142adbb6e0ca950c1983c73ff1a065"
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
