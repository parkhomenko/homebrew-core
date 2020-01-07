class PonyStable < Formula
  desc "Dependency manager for the Pony language"
  homepage "https://github.com/ponylang/pony-stable"
  url "https://github.com/ponylang/pony-stable/archive/0.2.2.tar.gz"
  sha256 "8fca5f0f600e695d648200a7492c5d8cea82581f4e4e138f0bb621911d9e4c13"
  head "https://github.com/ponylang/pony-stable.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "ac8a8ee51543c3529f4d6d0d385c93602b146a7d62a9e7012c4d61bb374f9f78" => :catalina
    sha256 "7da637b58849f22f8ff032854b405eb5a7c32ea3603b524146e4cf24f67ded1c" => :mojave
    sha256 "a81295a6570890eb1b6ae816a80d58ffa8960858efbd4744a8ec7bd22986eadc" => :high_sierra
    sha256 "7e6c0e27461f443549eeaad7430ccee0fc8b833acf5c9658255de4d5dcd52b21" => :sierra
  end

  depends_on "ponyc"

  def install
    system "make", "prefix=#{prefix}", "install"
  end

  test do
    (testpath/"test/main.pony").write <<~EOS
      actor Main
        new create(env: Env) =>
          env.out.print("Hello World!")
    EOS
    system "#{bin}/stable", "env", "ponyc", "test"
    assert_equal "Hello World!", shell_output("./test1").chomp
  end
end
