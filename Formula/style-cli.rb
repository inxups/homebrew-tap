class StyleCli < Formula
  desc "Manage rules and native hooks for coding harnesses"
  homepage "https://github.com/inxups/style-cli"
  url "https://github.com/inxups/style-cli/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "e659db513508f280560e40b558f39ca7edf08bd1feb22385a49402122e383550"
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
