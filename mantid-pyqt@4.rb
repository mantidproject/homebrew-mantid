class MantidPyqtAT4 < Formula
  desc "Python bindings for Qt"
  homepage "https://www.riverbankcomputing.com/software/pyqt/intro"
  url "https://sourceforge.net/projects/pyqt/files/PyQt4/PyQt-4.12.3/PyQt4_gpl_mac-4.12.3.tar.gz/download"
  sha256 "293e4be7dd741db72b1265e062ea14332ba5532741314f64eb935d141570305f"
  revision 2

  conflicts_with 'pyqt@4', :because => 'both install PyQt4. This formula contains a patch for Python 3.7+. Please remove pyqt@4.'

  depends_on "python@3.8"
  depends_on "cartr/qt4/qt@4"
  depends_on "cartr/qt4/qt-webkit@2.3" => :recommended

  # Patch to avoid benign exception with Python 3.7. Backported from 5.13 branch
  patch do
    url "https://raw.githubusercontent.com/mantidproject/homebrew-mantid/ba8ea158e63e20ba879f92f6bd685f7cc54f4aab/patches/qobjectdefs.sip.patch"
    sha256 "0f0eb5e07064be5470a316cdcd070b08108638affaf3ea5916433003baaffb9b"
  end

  patch do
    url "https://raw.githubusercontent.com/mantidproject/homebrew-mantid/7caaae55bd332c5ef4cf55cf5f2e7a73d7917016/patches/configure-ng.py.patch"
    sha256 "04c1f43058154fd96534aa82994a01d99ee163bc28daae8eaa623e3beae5b8bf"
  end
  
  def install
    ENV.prepend_path "PATH", Formula["python@3.8"].opt_bin
    # On Mavericks we want to target libc++, this requires a non default qt makespec
    if ENV.compiler == :clang && MacOS.version >= :mavericks
      ENV.append "QMAKESPEC", "unsupported/macx-clang-libc++"
    end

    ["python3"].each do |python|
      version = Language::Python.major_minor_version python
      sip_site_packages = "#{Formula["sip"].opt_lib}/python#{version}/site-packages"
      ENV.append_path "PYTHONPATH", sip_site_packages

      args = %W[
        --confirm-license
        --bindir=#{bin}
        --destdir=#{lib}/python#{version}/site-packages
        --sipdir=#{share}/sip
        --qmake=#{Formula["qt@4"].bin}/qmake
        --no-designer-plugin
        --no-qsci-api
      ]

      # sip at HEAD from homebrew-core is now built for PyQt5 only. Build a private copy here
      # using the same version but just copy in the sip.so to PyQt4
      require "pathname"
      require "tmpdir"
      pyqt_build_dir = Pathname.getwd
      sip_build_dir = Dir.mktmpdir
      begin
        Dir.chdir(sip_build_dir)
        # this will need to be updated when the sip Forumla in homebrew-core gets updated
        system "curl", "https://www.riverbankcomputing.com/static/Downloads/sip/4.19.20/sip-4.19.20.tar.gz", "-o", "sip.tar.gz"
        system "tar", "--strip-components=1", "-x", "-z", "-f", "sip.tar.gz"
        system python, "configure.py",
                      "--deployment-target=#{MacOS.version}",
                      "--destdir=#{lib}/python#{version}/site-packages",
                      "--bindir=#{bin}",
                      "--incdir=#{include}",
                      "--sipdir=#{HOMEBREW_PREFIX}/share/sip",
                      "--sip-module", "PyQt4.sip"
        system "make"
        system "mkdir", "-p", "#{lib}/python#{version}/site-packages/PyQt4"
        system "install", "siplib/sip.so", "#{lib}/python#{version}/site-packages/PyQt4"

        Dir.chdir(pyqt_build_dir)
        # On Mavericks we want to target libc++, this requires a non default qt makespec
        if ENV.compiler == :clang && MacOS.version >= :mavericks
          args << "--spec" << "unsupported/macx-clang-libc++"
        end

        args << "--no-stubs" << "--sip=#{sip_build_dir}/sipgen/sip"
        
        system python, "configure-ng.py", *args
        system "make"
        system "make", "install"
      ensure
        remove_entry_secure sip_build_dir
      end
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
