require "formula"
require "language/go"
require "open-uri"

class GomematicCli < Formula
  desc "Lightweight and powerful Homematic - CLI"
  homepage "https://github.com/gomematic/gomematic-cli"

  head do
    url "https://github.com/gomematic/gomematic-cli.git", :branch => "master"
    depends_on "go" => :build
  end

  stable do
    url "https://dl.gomematic.tech/cli/0.1.0/gomematic-cli-0.1.0-darwin-amd64"
    sha256 begin
      open("https://dl.gomematic.tech/cli/0.1.0/gomematic-cli-0.1.0-darwin-amd64.sha256").read.split(" ").first
    rescue
      nil
    end
    version "0.1.0"
  end

  devel do
    url "https://dl.gomematic.tech/cli/testing/gomematic-cli-testing-darwin-amd64"
    sha256 begin
      open("https://dl.gomematic.tech/cli/testing/gomematic-cli-testing-darwin-amd64.sha256").read.split(" ").first
    rescue
      nil
    end
    version "master"
  end

  test do
    system "#{bin}/gomematic-cli", "--version"
  end

  def install
    case
    when build.head?
      ENV["GOPATH"] = buildpath
      ENV["GOHOME"] = buildpath
      ENV["CGO_ENABLED"] = 0
      ENV["TAGS"] = ""

      ENV.prepend_create_path "PATH", buildpath / "bin"

      currentpath = buildpath / "gomematic-cli"
      currentpath.install Dir["*"]
      Language::Go.stage_deps resources, buildpath / "src"

      cd currentpath do
        system "make", "test", "build"

        bin.install "bin/gomematic-cli"
        # bash_completion.install "contrib/bash-completion/_gomematic-cli"
        # zsh_completion.install "contrib/zsh-completion/_gomematic-cli"
        prefix.install_metafiles
      end
    when build.devel?
      bin.install "#{buildpath}/gomematic-cli-testing-darwin-amd64" => "gomematic-cli"
    else
      bin.install "#{buildpath}/gomematic-cli-0.1.0-darwin-amd64" => "gomematic-cli"
    end
  end
end
