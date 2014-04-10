require "formula"

# Documentation: https://github.com/Homebrew/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Qwtplot3d < Formula
  homepage "http://qwtplot3d.sourceforge.net"
  #url "http://downloads.sourceforge.net/project/qwtplot3d/qwtplot3d/0.2.7/qwtplot3d-0.2.7.zip"
  #sha1 "17f55d37ac93fd17d7f3f6b90031ceb796bfe6d1"
  url "https://github.com/mantidproject/homebrew-mantid/raw/master/kits/qwtplot3d-0.2.7.tgz"
  sha1 "ee1ae74e257f7afe55a96f16eb90c72107063c93"

  depends_on :x11
  depends_on 'qt'

#  def patches
#    "https://gist.githubusercontent.com/sic/9519552/raw/0b7547cad093c585ade5e9b9f630c805473f1253/gistfile1.diff"
#  end

    # TODO: Apply patch
  #def patches
      # fixes something small
  #    { :p0 => DATA }
  #    { :p0 => "https://gist.githubusercontent.com/sic/9519552/raw/d586601fddcfbb59cc520c781a58fe4ddaff7029/gistfile1.diff" }
  #end

  #def patches
  #   { :p0 => DATA }
  #end

  #patch :p0, :DATA

  def install
    
    ENV.append_to_cflags "-I#{MacOS::X11.include}"

    inreplace 'qwtplot3d.pro' do |s|
      s.gsub! /^\s*DESTDIR\s*=(.*)$/, "DESTDIR=#{prefix}"
      #s.gsub! /^\s*INCLUDEPATH\s*=(.*)$/, "INCLUDEPATH = include /opt/X11/include"
    end

    #inreplace 'include/qwt3d_openglhelper.h', '#include "qglobal.h"', 
    #          '#include "qglobal.h" \n#include <GL/glu.h>'

    # TODO: add INCLUDEPATH += /opt/X11/include to qwtplot3d.pro

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

__END__
--- include/qwt3d_openglhelper.h	2005-07-19 11:40:28.000000000 -0400
+++ include/qwt3d_openglhelper.h.new	2014-03-18 15:22:02.000000000 -0400
@@ -1,6 +1,8 @@
 #ifndef __openglhelper_2003_06_06_15_49__
 #define __openglhelper_2003_06_06_15_49__
 
+#include <GL/glu.h>
+
 #include "qglobal.h"
 #if QT_VERSION < 0x040000
 #include <qgl.h>
