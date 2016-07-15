class Ospray < Formula
  desc ""
  homepage ""
  url "https://github.com/ospray/OSPRay/archive/v0.10.1.tar.gz"
  version "0.10.1"
  sha256 "f3820f7f0a216562652fbd34f20d6bdf8ca3f671e8ac9178f178f3565932df9c"

  depends_on "cmake" => :build
  depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on "freeglut"
  depends_on "tbb"
  depends_on "ispc"
  depends_on "qt4"

  def install
    # Remove unrecognized options if warned by configure
    system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test OSPRay`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
