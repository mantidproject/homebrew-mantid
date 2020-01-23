class MantidDeveloper < Formula
  include Language::Python::Virtualenv
  # get the pyport.patch file as we need it later and just because we have to have one
  # this is really a metapackage only
  url 'https://raw.githubusercontent.com/mantidproject/mantid/master/buildconfig/pyport.patch' #:using => :curl
  homepage "http://developer.mantidproject.org/BuildingOnOSX.html"
  version '1.3'
  sha256 "e9f83c057e70082c48f5576d3e7d0d257f55f1835ce659239c64445bb01da551"

  # framework dependencies
  depends_on "cmake"
  depends_on "openssl"
  depends_on "ninja"
  depends_on "python@2"
  depends_on "python"
  depends_on "pkg-config"
  depends_on "poco"
  depends_on "boost"
  depends_on "boost-python"
  depends_on "boost-python3"
  depends_on "gsl"
  depends_on "hdf5" => "build-from-source"
  depends_on "muparser"
  depends_on "nexusformat" => "hdf4"
  depends_on "jsoncpp"
  depends_on "tbb"
  depends_on "opencascade"
  depends_on "gperftools"
  depends_on "librdkafka"
  depends_on "clang-format"
  depends_on "ccache"
  
  # qt-related
  depends_on "qt@4"
  depends_on "qt"
  depends_on "mantid-pyqt@4"
  depends_on "mantid-pyqt5"
  depends_on "qscintilla2qt4"
  depends_on "qscintilla2"
  depends_on "qwt5"
  depends_on "qwtplot3d"

  def install
    # install a file so that homebrew thinks something was done
    prefix.install("pyport.patch")
  end
end
