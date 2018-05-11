class Qwt5 < Formula
  homepage "https://qwt.sourceforge.io/"
  url "https://downloads.sourceforge.net/project/qwt/qwt/5.2.3/qwt-5.2.3.tar.bz2"
  sha256 "37feaf306753230b0d8538b4ff9b255c6fddaa3d6609ec5a5cc39a5a4d020ab7"
  revision 1
  depends_on "cartr/qt4/qt@4"

  def install
    inreplace "qwtconfig.pri" do |s|
      # change_make_var won"t work because there are leading spaces
      s.gsub! /^\s*INSTALLBASE\s*=(.*)$/, "INSTALLBASE=#{prefix}"
    end

    args = ["-config", "release", "-spec"]
    # On Mavericks we want to target libc++, this requires a unsupported/macx-clang-libc++ flag
    if ENV.compiler == :clang && MacOS.version >= :mavericks
      args << "unsupported/macx-clang-libc++"
    else
      args << "macx-g++"
    end
    system "qmake", *args
    system "make"
    system "make", "install"
  end

  def caveats; <<~EOS
    The qwtmathml library contains code of the MML Widget from the Qt solutions package.
    Beside the Qwt license you also have to take care of its license.
  EOS
  end
end
