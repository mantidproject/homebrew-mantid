# This is an EXPERIMENTAL brew formula for mantid dependencies
require 'formula'

class MantidDev < Formula
  include Language::Python::Virtualenv	
  # get the pyport.patch file as we need it later and just because we have to have one
  # this is really a metapackage only
  url 'https://raw.githubusercontent.com/mantidproject/mantid/master/buildconfig/pyport.patch' #:using => :curl
  homepage "https://github.com/mantidproject/mantid/wiki/Building-Mantid-on-OS-X-10.9-&-10.10-using-clang-and-Xcode"
  version '1.1'
  sha256 "e9f83c057e70082c48f5576d3e7d0d257f55f1835ce659239c64445bb01da551"
  
  depends_on "boost"
  depends_on "boost-python"
  depends_on "boost-mpi"
  depends_on "ccache"
  depends_on "cmake"
  depends_on "clang-format"
  depends_on "cppcheck"
  depends_on "doxygen"
  depends_on "eigen"
  depends_on "google-perftools"
  depends_on "graphviz"
  depends_on "gsl"
  depends_on "hdf5" => '--c++11'
  depends_on "h5py" => '--without-python'
  depends_on "jsoncpp"
  depends_on "libmxml"
  depends_on "librdkafka"
  depends_on "muparser"
  depends_on "nexusformat" => '--c++11'
  depends_on "ninja" => '--without-test'
  depends_on "opencascade"
  depends_on "openssl" 
  depends_on "poco"
  depends_on "qt@4"
  depends_on "qscintilla2qt4" => '--without-python'
  depends_on "qwt5"
  depends_on "qwtplot3d"
  depends_on "pyqt@4" => '--without-python'
  depends_on "sip" => '--without-python'
  depends_on "tbb" => '--c++11'
  depends_on "numpy"
  depends_on "scipy"
  depends_on "qt"
  depends_on "qscintilla2"
  depends_on "pyqt"
	
  resource "matplotlib" do
    url "https://files.pythonhosted.org/packages/ec/ed/46b835da53b7ed05bd4c6cae293f13ec26e877d2e490a53a709915a9dcb7/matplotlib-2.2.2.tar.gz"
    sha256 "4dc7ef528aad21f22be85e95725234c5178c0f938e2228ca76640e5e84d8cde8"
  end
	
  def install
    virtualenv_install_with_resources
    # prefix.install("pyport.patch")
    system "brew uninstall --ignore-dependencies python@2"
    system "brew uninstall --ignore-dependencies python"	
  end
	
end
