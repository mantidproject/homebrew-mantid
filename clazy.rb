class Clazy < Formula
  desc "Qt oriented code checker based on clang framework"
  homepage "https://github.com/KDE/clazy"
  url "https://download.kde.org/stable/clazy/1.3/src/clazy-1.3.tar.xz"
  sha256 "0a9470d653e1c73e06db1421fa922f6ea286408de5abc98e4743b9aee5655188"

  head "git://anongit.kde.org/clazy.git"

  depends_on "cmake" => :build

  depends_on "llvm"
  depends_on "qt"

  def install
    args = std_cmake_args
    args << "-DBUILD_TESTING=OFF"
    args << "-DCMAKE_INSTALL_MANDIR=#{man}"

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
      prefix.install "install_manifest.txt"
    end
  end
end
