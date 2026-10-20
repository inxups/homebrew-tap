class StyleCli < Formula
  desc "Manage rules and native hooks for coding harnesses"
  homepage "https://github.com/inxups/style-cli"
  url "https://github.com/inxups/style-cli/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "a601cf24e8f8feb5d139833bb22c8baf8723f4cc5c0fb8a5bdbfa618da54e477"
  license "MIT"
  head "https://github.com/inxups/style-cli.git", branch: "main"

  depends_on "go" => :build

  conflicts_with "style", because: "both install a `style` binary"

  def install
    ldflags = "-s -w -X github.com/inxups/style-cli/internal/app.Version=#{version}"
    system "go", "build", *std_go_args(ldflags:, output: bin/"style"), "./cmd/style"
    doc.install "third_party"
  end

  test do
    assert_equal "style #{version}", shell_output("#{bin}/style --version").strip
  end
end
