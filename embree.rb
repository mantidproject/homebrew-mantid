class Embree < Formula
  desc ""
  homepage ""
  url "https://github.com/embree/embree/archive/v2.10.0.tar.gz"
  version "2.10.0"
  sha256 "c011dc3c035c9618733a2e256ca24efe54aea937f86069e24ff87b02af2d50e4"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on "tbb"

  def install
    system "cmake", ".", *std_cmake_args, "-DXEON_ISA=AVX"
    system "make"
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test embree`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
