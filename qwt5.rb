require 'formula'

class Qwt5 < Formula
  homepage 'http://qwt.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/qwt/qwt/5.2.3/qwt-5.2.3.tar.bz2'
  sha1 'ff81595a1641a8b431f98d6091bb134bc94e0003'

  depends_on 'qt'

  def install
    inreplace 'qwtconfig.pri' do |s|
      # change_make_var won't work because there are leading spaces
      s.gsub! /^\s*INSTALLBASE\s*=(.*)$/, "INSTALLBASE=#{prefix}"
    end

    args = ['-config', 'release', '-spec']
    # On Mavericks we want to target libc++, this requires a unsupported/macx-clang-libc++ flag
    if ENV.compiler == :clang and MacOS.version >= :mavericks
      args << "unsupported/macx-clang-libc++"
    else
      args << "macx-g++"
    end
    system 'qmake', *args
    system "make"
    system "make install"
  end

  def caveats; <<-EOS.undent
      The qwtmathml library contains code of the MML Widget from the Qt solutions package.
      Beside the Qwt license you also have to take care of its license.
    EOS
  end
end