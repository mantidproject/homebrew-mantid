# This is an EXPERIMENTAL brew formula for mantid dependencies
require 'formula'

class MantidDev < Formula
  # include Language::Python::Virtualenv	
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
  depends_on "clang-format"
  depends_on "cppcheck"
  depends_on "doxygen"
  depends_on "eigen"
  depends_on "google-perftools"
  depends_on "graphviz"
  depends_on "gsl"
  depends_on "hdf5"
  depends_on "h5py"
  depends_on "jsoncpp"
  depends_on "libmxml"
  depends_on "librdkafka"
  depends_on "muparser"
  depends_on "nexusformat"
  depends_on "opencascade" 
  depends_on "openssl"
  depends_on "poco"
  depends_on "qt@4"
  depends_on "qt"
  depends_on "qscintilla2qt4"
  depends_on "qscintilla2"
  depends_on "qwt5"
  depends_on "qwtplot3d"
  depends_on "pyqt@4"
  depends_on "pyqt"
  depends_on "sip"
  depends_on "tbb"

  def install
      
  end
	
end
