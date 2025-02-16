class Pnpm < Formula
  require "language/node"

  desc "📦🚀 Fast, disk space efficient package manager"
  homepage "https://pnpm.js.org"
  url "https://registry.npmjs.org/pnpm/-/pnpm-5.4.10.tgz"
  sha256 "b36ea231b6281b5afff653abb8f90f29829b9fd8f51389bf461739c6529f5462"
  license "MIT"

  bottle do
    cellar :any_skip_relocation
    sha256 "5b50dc6805a853d851b81b40648de627ec8b04d2387c5ec52073b7988cadd778" => :catalina
    sha256 "6248fe81719291763412418dccf17247811cf9c8d04eaef555c58fd029055faf" => :mojave
    sha256 "40be0deb94700688089f77e38741cb6bb53c892a20af548d948d37624c70eb40" => :high_sierra
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/pnpm", "init", "-y"
    assert_predicate testpath/"package.json", :exist?, "package.json must exist"
  end
end
