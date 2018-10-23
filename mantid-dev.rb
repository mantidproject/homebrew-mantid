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
  
  depends_on "boost-python" => '--c++11'
  depends_on "boost-mpi"
  depends_on "ccache"
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
  depends_on "poco"
  depends_on "qt@4"
  depends_on "qscintilla2qt4" => '--without-python'
  depends_on "qwt5"
  depends_on "qwtplot3d"
  depends_on "pyqt@4" => '--without-python'
  depends_on "sip" => '--without-python'
  depends_on "tbb" => '--c++11'

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/d5/6e/f00492653d0fdf6497a181a1c1d46bbea5a2383e7faf4c8ca6d6f3d2581d/numpy-1.14.5.zip"
    sha256 "a4a433b3a264dbc9aa9c7c241e87c0358a503ea6394f8737df1683c7c9a102ac"
  end
	
  def install
    virtualenv_install_with_resources
    prefix.install("pyport.patch")
  end
	
end
