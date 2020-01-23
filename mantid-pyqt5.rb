# Temporary formula to workaround a bug in PyQt5 5.10/Python 3.7
# We need to keep back Homebrew updates while we support Python 2/3
class MantidPyqt5 < Formula
  desc "Python 3 bindings for v5 of Qt"
  homepage "https://www.riverbankcomputing.com/software/pyqt/download5"
  url "https://dl.bintray.com/homebrew/mirror/pyqt-5.10.1.tar.gz"
  mirror "https://downloads.sourceforge.net/project/pyqt/PyQt5/PyQt-5.10.1/PyQt5_gpl-5.10.1.tar.gz"
  sha256 "9932e971e825ece4ea08f84ad95017837fa8f3f29c6b0496985fa1093661e9ef"
  revision 1

  conflicts_with 'pyqt', :because => 'both install PyQt4. This formula contains a patch for Python 3.7. Please remove pyqt5.'

  depends_on "python"
  depends_on "python@2"
  depends_on "qt"
  depends_on "sip"

  # Patch from openSUSE for compatibility with Qt 5.11.0
  # https://build.opensuse.org/package/show/home:cgiboudeaux:branches:KDE:Qt5/python-qt5
  patch do
    url "https://raw.githubusercontent.com/Homebrew/formula-patches/4f563668/pyqt/qt-5.11.diff"
    sha256 "34bba97f87615ea072312bfc03c4d3fb0a1cf7a4cd9d6907857c1dca6cc89200"
  end

  # Patch to avoid benign exception with Python 3.7. Backported from 5.13 branch
  patch do
    url "https://raw.githubusercontent.com/mantidproject/homebrew-mantid/ba8ea158e63e20ba879f92f6bd685f7cc54f4aab/patches/qobjectdefs.sip.patch"
    sha256 "0f0eb5e07064be5470a316cdcd070b08108638affaf3ea5916433003baaffb9b"
  end
  
  
  def install
    ["python2", "python3"].each do |python|
      version = Language::Python.major_minor_version python
      args = ["--confirm-license",
              "--bindir=#{bin}",
              "--destdir=#{lib}/python#{version}/site-packages",
              "--stubsdir=#{lib}/python#{version}/site-packages/PyQt5",
              "--sipdir=#{share}/sip/Qt5",
              # sip.h could not be found automatically
              "--sip-incdir=#{Formula["sip"].opt_include}",
              "--qmake=#{Formula["qt"].bin}/qmake",
              # Force deployment target to avoid libc++ issues
              "QMAKE_MACOSX_DEPLOYMENT_TARGET=#{MacOS.version}",
              "--qml-plugindir=#{pkgshare}/plugins",
              "--verbose"]

      system python, "configure.py", *args
      system "make"
      system "make", "install"
      system "make", "clean"
    end
  end

  test do
    system "#{bin}/pyuic5", "--version"
    system "#{bin}/pylupdate5", "-version"

    ["python2", "python3"].each do |python|
      system python, "-c", "import PyQt5"
      %w[
        Gui
        Location
        Multimedia
        Network
        Quick
        Svg
        WebEngineWidgets
        Widgets
        Xml
      ].each { |mod| system python, "-c", "import PyQt5.Qt#{mod}" }
    end
  end
end
