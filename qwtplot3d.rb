require "formula"

class Qwtplot3d < Formula
  homepage "http://qwtplot3d.sourceforge.net"
  url "https://github.com/mantidproject/homebrew-mantid/raw/master/kits/qwtplot3d-0.2.7.tgz"
  sha256 "8ed5f5cc9d5db2ca195e41280dbe8d2c971ca12253a0c02368fb37c491e5952b"

  depends_on :x11
  depends_on 'qt'

  def install
    
    ENV.append_to_cflags "-I#{MacOS::X11.include}"

    inreplace 'qwtplot3d.pro' do |s|
      s.gsub! /^\s*DESTDIR\s*=(.*)$/, "DESTDIR=#{prefix}"
    end

    lib.mkpath

    args = ['-config', 'release', '-spec']
    # On Mavericks we want to target libc++, this requires a unsupported/macx-clang-libc++ flag
    if ENV.compiler == :clang and MacOS.version >= :mavericks
      args << "unsupported/macx-clang-libc++"
    else
      args << "macx-g++"
    end
    system 'qmake', *args
    system "make"

    lib.install Dir["#{prefix}/libqwt*"]

    include.install Dir['include/*.h'] 

  end
end

