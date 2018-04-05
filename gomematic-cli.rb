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
    url "https://dl.webhippie.de/gomematic/cli/0.1.0/gomematic-cli-0.1.0-darwin-10.6-amd64"
    sha256 open("https://dl.webhippie.de/gomematic/cli/0.1.0/gomematic-cli-0.1.0-darwin-10.6-amd64.sha256").read.split(" ").first
    version "0.1.0"
  end

  devel do
    url "https://dl.webhippie.de/gomematic/cli/master/gomematic-cli-master-darwin-10.6-amd64"
    sha256 open("https://dl.webhippie.de/gomematic/cli/master/gomematic-cli-master-darwin-10.6-amd64.sha256").read.split(" ").first
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

      ENV.prepend_create_path "PATH", buildpath/"bin"

      currentpath = buildpath/"src/github.com/gomematic/gomematic-cli"
      currentpath.install Dir["*"]
      Language::Go.stage_deps resources, buildpath/"src"

      cd currentpath do
        system "make", "test", "build"

        bin.install "gomematic-cli"
        # bash_completion.install "contrib/bash-completion/_gomematic-cli"
        # zsh_completion.install "contrib/zsh-completion/_gomematic-cli"
        prefix.install_metafiles
      end
    when build.devel?
      bin.install "#{buildpath}/gomematic-cli-master-darwin-10.6-amd64" => "gomematic-cli"
    else
      bin.install "#{buildpath}/gomematic-cli-0.1.0-darwin-10.6-amd64" => "gomematic-cli"
    end
  end
end
