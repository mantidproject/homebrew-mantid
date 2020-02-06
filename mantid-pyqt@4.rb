class MantidPyqtAT4 < Formula
  desc "Python bindings for Qt"
  homepage "https://www.riverbankcomputing.com/software/pyqt/intro"
  url "https://sourceforge.net/projects/pyqt/files/PyQt4/PyQt-4.12.1/PyQt4_gpl_mac-4.12.1.tar.gz/download"
  sha256 "3224ab2c4d392891eb0abbc2bf076fef2ead3a5bb36ceae2383df4dda00ccce5"
  revision 1

  conflicts_with 'pyqt@4', :because => 'both install PyQt4. This formula contains a patch for Python 3.7. Please remove pyqt@4.'

  depends_on "python"
  depends_on "qt"
  depends_on "sip"
  depends_on "cartr/qt4/qt@4"
  depends_on "cartr/qt4/qt-webkit@2.3" => :recommended

  # Patch to avoid benign exception with Python 3.7. Backported from 5.13 branch
  patch do
    url "https://raw.githubusercontent.com/mantidproject/homebrew-mantid/ba8ea158e63e20ba879f92f6bd685f7cc54f4aab/patches/qobjectdefs.sip.patch"
    sha256 "0f0eb5e07064be5470a316cdcd070b08108638affaf3ea5916433003baaffb9b"
  end

  patch do
    url "https://raw.githubusercontent.com/mantidproject/homebrew-mantid/6a012843ad1c3b4bf711a8ff76597d8e9d47a2a4/patches/configure-ng.py.patch"
    sha256 "08a2ff869fe884e49c0c3d3e9865b8ccef27e16dbce37f16db878b860e73e814"
  end
  
  def install
    # On Mavericks we want to target libc++, this requires a non default qt makespec
    if ENV.compiler == :clang && MacOS.version >= :mavericks
      ENV.append "QMAKESPEC", "unsupported/macx-clang-libc++"
    end

    ["python3"].each do |python|
      version = Language::Python.major_minor_version python
      ENV.append_path "PYTHONPATH", "#{Formula["sip"].opt_lib}/python#{version}/site-packages"

      args = %W[
        --confirm-license
        --bindir=#{bin}
        --destdir=#{lib}/python#{version}/site-packages
        --sipdir=#{share}/sip
        --qmake=#{Formula["qt@4"].bin}/qmake
      ]

      # We need to run "configure.py" so that pyqtconfig.py is generated, which
      # is needed by QGIS, PyQWT (and many other PyQt interoperable
      # implementations such as the ROS GUI libs). This file is currently needed
      # for generating build files appropriate for the qmake spec that was used
      # to build Qt. The alternatives provided by configure-ng.py is not
      # sufficient to replace pyqtconfig.py yet (see
      # https://github.com/qgis/QGIS/pull/1508). Using configure.py is
      # deprecated and will be removed with SIP v5, so we do the actual compile
      # using the newer configure-ng.py as recommended. In order not to
      # interfere with the build using configure-ng.py, we run configure.py in a
      # temporary directory and only retain the pyqtconfig.py from that.

      require "tmpdir"
      dir = Dir.mktmpdir
      begin
        cp_r(Dir.glob("*"), dir)
        cd dir do
          system python, "configure.py", *args
          inreplace "pyqtconfig.py", "#{HOMEBREW_CELLAR}/#{Formula["cartr/qt4/qt@4"].name}/#{Formula["cartr/qt4/qt@4"].pkg_version}",
            Formula["cartr/qt4/qt@4"].opt_prefix
          (lib/"python#{version}/site-packages/PyQt4").install "pyqtconfig.py"
        end
      ensure
        remove_entry_secure dir
      end

      # On Mavericks we want to target libc++, this requires a non default qt makespec
      if ENV.compiler == :clang && MacOS.version >= :mavericks
        args << "--spec" << "unsupported/macx-clang-libc++"
      end

      args << "--no-stubs"

      system python, "configure-ng.py", *args
      system "make"
      system "make", "install"
      system "make", "clean" # for when building against multiple Pythons
    end
  end

  def caveats
    "Phonon support is broken."
  end

  test do
    Pathname("test.py").write <<~EOS
      from PyQt4 import QtNetwork
      QtNetwork.QNetworkAccessManager().networkAccessible()
    EOS

    Language::Python.each_python(build) do |python, _version|
      system python, "test.py"
    end
  end
  
end
