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
  
  resource "pycrypto" do
    url "https://files.pythonhosted.org/packages/60/db/645aa9af249f059cc3a368b118de33889219e0362141e75d4eaf6f80f163/pycrypto-2.6.1.tar.gz"
    sha256 "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c"
  end

  def install
    venv = virtualenv_create(libexec,"python")
    venv.pip_install resources
    bundle_path = libexec/"lib/python2.7/site-packages"
    (lib/"python2.7/site-packages/homebrew-mantid-developer-bundle.pth").write "#{bundle_path}\n"
    #prefix.install("pyport.patch")	  
  end
	
end
