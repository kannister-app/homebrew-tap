class Krate < Formula
  desc "Micro-VM engine for developer workload isolation"
  homepage "https://kannister.app"
  version "0.10.0"
  license "Commercial"

  depends_on :macos
  depends_on arch: :arm64

  # Bottle will be populated by krate-build pipeline.
  # Until then, this formula builds from source (requires Rust).
  # bottle do
  #   root_url "https://ghcr.io/v2/kannister-app/krate/krate-bottle"
  #   sha256 cellar: :any_skip_relocation, arm64_monterey: "TBD"
  # end

  def install
    odie "krate requires Apple Silicon (M1 or later)" unless Hardware::CPU.arm?
    bin.install "krate" if File.exist? "krate"
    bin.install "anvild" if File.exist? "anvild"
  end

  service do
    run [opt_bin/"anvild"]
    keep_alive true
    log_path var/"log/krate/anvild.log"
    error_log_path var/"log/krate/anvild-error.log"
  end

  def post_install
    system "brew", "services", "start", "krate"
  end

  def caveats
    <<~EOS
      anvild starts automatically on login.

      Manage manually:
        brew services start krate
        brew services stop krate

      Note: `brew upgrade krate` restarts anvild and stops running workloads.

      To build custom kernels or workloads (requires Docker):
        krate build --spec minimal-linux/6.6.30
    EOS
  end
end
