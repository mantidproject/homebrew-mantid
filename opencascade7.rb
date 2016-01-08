class Opencascade7 < Formula
  desc "Environment for 3D modeling and development of numerical simulation software including CAD/CAM/CAE"
  homepage "http://www.opencascade.org/"
  url "https://github.com/mantidproject/homebrew-mantid/raw/master/kits/opencascade-7.0.0-beta.tgz"
  sha256 "134e0065168e7dfe50368e5db05bacc9d302ac2bb17a077ab0b1f6d0d3dae2d9"

  conflicts_with "oce", :because => "OCE is a fork for patches/improvements/experiments over OpenCascade"
  conflicts_with "opencascade", :because => "formula is a fork of opencascade"

  option "without-opencl", "Build without OpenCL support" if OS.mac?
  option "without-extras", "Don't install documentation (~725MB) or samples (~40MB)"
  option "with-tests", "Install tests (~55MB)"

  depends_on "cmake" => :build
  depends_on "freetype"
  depends_on "qt"
  depends_on "freeimage" => :recommended
  depends_on "gl2ps" => :recommended
  depends_on "tbb" => :recommended if OS.mac? # Couldn't make it find TBB...
  depends_on :macos => :snow_leopard

  def install    # recent xcode stores it's sdk in the application folder
    sdk_path = Pathname.new `xcrun --show-sdk-path`.strip

    # setting DYLD causes many issues; all tests work fine without; suppress
    inreplace "env.sh", "export DYLD_LIBRARY_PATH", "export OCCT_DYLD_LIBRARY_PATH" if OS.mac?

    cmake_args = std_cmake_args
    cmake_args = cmake_args.map { |s| s.gsub(/RELEASE/, "DEBUG") }.map { |s| s.gsub(/Release/, "Debug") }
    cmake_args << "-DBUILD_CONFIGURATION=Debug"
    cmake_args << "-DCMAKE_PREFIX_PATH:PATH=#{HOMEBREW_PREFIX}"
    cmake_args << "-DCMAKE_INCLUDE_PATH:PATH=#{HOMEBREW_PREFIX}/lib"
    cmake_args << "-DCMAKE_FRAMEWORK_PATH:PATH=#{HOMEBREW_PREFIX}/Frameworks" if OS.mac?
    cmake_args << "-DINSTALL_DIR:PATH=#{prefix}"
    cmake_args << "-D3RDPARTY_DIR:PATH=#{HOMEBREW_PREFIX}"
    cmake_args << "-D3RDPARTY_TCL_DIR:PATH=/usr"
    cmake_args << "-D3RDPARTY_TCL_INCLUDE_DIR:PATH=#{sdk_path}/usr/include/"
    cmake_args << "-D3RDPARTY_TK_INCLUDE_DIR:PATH=#{sdk_path}/usr/include/"
    cmake_args << "-DINSTALL_TESTS:BOOL=ON" if build.with? "tests"
    cmake_args << "-D3RDPARTY_TBB_DIR:PATH=#{HOMEBREW_PREFIX}" if build.with? "tbb"
    cmake_args << "-DINSTALL_SAMPLES=ON" if build.with? "extras"

    # must specify, otherwise finds old ft2config.h in /usr/X11R6
    cmake_args << "-D3RDPARTY_FREETYPE_INCLUDE_DIR:PATH=#{HOMEBREW_PREFIX}/include/freetype2" if OS.mac?

    %w[freeimage gl2ps opencl tbb].each do |feature|
      cmake_args << "-DUSE_#{feature.upcase}:BOOL=ON" if build.with? feature
    end

    opencl_path = Pathname.new "#{sdk_path}/System/Library/Frameworks/OpenCL.framework/Versions/Current"
    if build.with?("opencl") && opencl_path.exist?
      cmake_args << "-D3RDPARTY_OPENCL_INCLUDE_DIR:PATH=#{opencl_path}/Headers"
      cmake_args << "-D3RDPARTY_OPENCL_DLL:FILEPATH=#{opencl_path}/Libraries/libcl2module.dylib"

      # link against the Apple built-in OpenCL Framework
      # inreplace "adm/cmake/TKOpenGL/CMakeLists.txt", "list( APPEND TKOpenGl_USED_LIBS OpenCL )", <<-EOF.undent
      #  find_library(FRAMEWORKS_OPENCL NAMES OpenCL)
      #  list( APPEND TKOpenGl_USED_LIBS ${FRAMEWORKS_OPENCL} )
      # EOF
    end

    system "cmake", ".", *cmake_args
    system "make", "install"

    if build.with? "extras"
      prefix.install "doc", "samples"
    end

    # add symlinks to be able to compile against OpenCascade
    loc = OS.mac? ? "#{prefix}/mac64/clang" : "#{prefix}/lin64/gcc"
    include.install_symlink Dir["#{prefix}/include/opencascade-7.0.0.beta/*"]
    bin.install_symlink Dir["#{loc}/bin/*"]
    lib.install_symlink Dir["#{loc}/lib/*"]
  end

  def caveats; <<-EOF.undent
    Some apps will require this enviroment variable:
      CASROOT=#{opt_prefix}

    On Linux make sure the following libraries are installed:
      sudo apt-get install libgl2ps-dev tcl8.6-dev tk8.6-dev libgl1-mesa-dev libglu1-mesa-dev libxmu-dev libxext-dev
    EOF
  end

  test do
    ENV["CASROOT"] = opt_prefix
    "1\n"==`#{bin}/DRAWEXE -c \"pload ALL\"`
  end
end
