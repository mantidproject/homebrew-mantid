class MantidDeveloper < Formula
  include Language::Python::Virtualenv
  # get the pyport.patch file as we need it later and just because we have to have one
  # this is really a metapackage only
  url 'https://raw.githubusercontent.com/mantidproject/mantid/master/buildconfig/pyport.patch' #:using => :curl
  homepage "https://github.com/mantidproject/mantid/wiki/Building-Mantid-on-OS-X-10.9-&-10.10-using-clang-and-Xcode"
  version '1.1'
  sha256 "e9f83c057e70082c48f5576d3e7d0d257f55f1835ce659239c64445bb01da551"

  depends_on "openssl"
  depends_on "qt@4"
  depends_on "cmake"
  depends_on "ninja"
  depends_on "sip"
  depends_on "pyqt@4"
  depends_on "qscintilla2qt4"
  depends_on "poco"
  depends_on "boost"
  depends_on "boost-python"
  depends_on "gsl"
  depends_on "hdf5"
  depends_on "h5py"
  depends_on "libmxml"
  depends_on "muparser"
  depends_on "nexusformat"
  depends_on "jsoncpp"
  depends_on "tbb"
  depends_on "oce"
  depends_on "openssl"
  depends_on "qwt5"
  depends_on "qwtplot3d"
  depends_on "google-perftools"
  depends_on "librdkafka"
  #depends_on "python@2" => :optional
  depends_on "python" => :recommended
  depends_on "numpy"
  depends_on "scipy"
  depends_on "freetype"

#  resource "setuptools" do
#    url "https://files.pythonhosted.org/packages/dc/8c/7c9869454bdc53e72fb87ace63eac39336879eef6f2bf96e946edbf03e90/setuptools-33.1.1.zip"
#    sha256 "6b20352ed60ba08c43b3611bdb502286f7a869fbfcf472f40d7279f1e77de145"
#  end

  resource "kiwisolver" do
    url "https://files.pythonhosted.org/packages/31/60/494fcce70d60a598c32ee00e71542e52e27c978e5f8219fae0d4ac6e2864/kiwisolver-1.0.1.tar.gz"
    sha256 "ce3be5d520b4d2c3e5eeb4cd2ef62b9b9ab8ac6b6fedbaa0e39cdb6f50644278"
  end

  resource "Cycler" do
    url "https://files.pythonhosted.org/packages/c2/4b/137dea450d6e1e3d474e1d873cd1d4f7d3beed7e0dc973b06e8e10d32488/cycler-0.10.0.tar.gz"
    sha256 "cd7b2d1018258d7247a71425e9f26463dfb444d411c39569972f4ce586b0c9d8"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/3c/ec/a94f8cf7274ea60b5413df054f82a8980523efd712ec55a59e7c3357cf7c/pyparsing-2.2.0.tar.gz"
    sha256 "0832bcf47acd283788593e7a0f542407bd9550a55a8a8435214a1960e04bcb04"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/a0/b0/a4e3241d2dee665fea11baec21389aec6886655cd4db7647ddf96c3fad15/python-dateutil-2.7.3.tar.gz"
    sha256 "e27001de32f627c22380a688bcc43ce83504a7bc5da472209b4c70f02829f0b8"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/10/76/52efda4ef98e7544321fd8d5d512e11739c1df18b0649551aeccfb1c8376/pytz-2018.4.tar.gz"
    sha256 "c06425302f2cf668f1bba7a0a03f3c1d34d4ebeef2c72003da308b3947c7f749"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"
    sha256 "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
  end

  resource "matplotlib" do
    url "https://files.pythonhosted.org/packages/ec/ed/46b835da53b7ed05bd4c6cae293f13ec26e877d2e490a53a709915a9dcb7/matplotlib-2.2.2.tar.gz"
    sha256 "4dc7ef528aad21f22be85e95725234c5178c0f938e2228ca76640e5e84d8cde8"
  end

  resource "qtawesome" do
    url "https://files.pythonhosted.org/packages/28/be/cadd6e06a6219f31d6153eb43e9f17dadb7c968835b10180a7bca39ae8ab/QtAwesome-0.4.4.tar.gz"
    sha256 "50f9c1d9ce34e57f5b13ef76d5c87e06de9804b8dfe1c34c4ba73197200f878a"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/14/a2/8ac7dda36eac03950ec2668ab1b466314403031c83a95c5efc81d2acf163/psutil-5.4.5.tar.gz"
    sha256 "ebe293be36bb24b95cdefc5131635496e88b17fabbcf1e4bc9b5c01f5e489cfe"
  end

  resource "sphinx" do
    url "https://files.pythonhosted.org/packages/40/45/d4a68a1f8dc669714f48d251afb4352036f87be5e9873cd27e57b9c141f0/Sphinx-1.7.4.tar.gz"
    sha256 "e9b1a75a3eae05dded19c80eb17325be675e0698975baae976df603b6ed1eb10"
  end

  resource "sphinx_bootstrap_theme" do
    url "https://files.pythonhosted.org/packages/8a/f6/e7dbc28e448817d2b103c57a3e4ee52f8edc143beab9595ced31e4789749/sphinx-bootstrap-theme-0.6.5.tar.gz"
    sha256 "82936109a05b84029052e7efb1756161c3b4c27ae18512a90234d50fe608cba7"
  end

  resource "mock" do
    url "https://files.pythonhosted.org/packages/0c/53/014354fc93c591ccc4abff12c473ad565a2eb24dcd82490fae33dbf2539f/mock-2.0.0.tar.gz"
    sha256 "b158b6df76edd239b8208d481dc46b6afd45a846b7812ff0ce58971cf5bc8bba"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/6b/f0/a0250248ea260d55748fff586d89a32afbb22656f4498b08d2636a48d4ec/PyYAML-3.12.zip"
    sha256 "5ac82e411044fb129bae5cfbeb3ba626acb2af31a8d17d175004b70862a741a7"
  end

  resource "pycifrw" do
    url "https://files.pythonhosted.org/packages/4c/ab/b4842d450c06104c3f037c391a1ac5165e677b1226b44bc47a0b9cbc1bd3/PyCifRW-4.4.tar.gz"
    sha256 "f365ed97991738a99722e08afe772fe197bf7f40dfc0a210d524e7742ad81ff8"
  end

  resource "qtpy" do
    url "https://files.pythonhosted.org/packages/af/c8/68398824dfffd8690fd87aba8c6564ca8f9db990e85414f44bf00fc1df90/QtPy-1.4.2.tar.gz"
    sha256 "1d1a4343540433a203280f162d43226e4c87489155fe4a9a6f1923ba11362bf9"
  end

  resource "notebook" do
    url "https://files.pythonhosted.org/packages/ac/50/4e8fc418c6b4beee3b0c39d38f82a1684bf5c4c9a216cc017e8a498686d6/notebook-5.5.0.tar.gz"
    sha256 "fa915c231e64a30d19cc2c70ccab6444cbaa93e44e92b5f8233dd9147ad0e664"
  end

  resource "qtconsole" do
    url "https://files.pythonhosted.org/packages/68/48/ed0e8989b7376704ecb8faa782384de98cc108de522ad8d21f449484de9a/qtconsole-4.3.1.tar.gz"
    sha256 "eff8c2faeda567a0bef5781f419a64e9977988db101652b312b9d74ec0a5109c"
  end

  resource "ipython" do
    url "https://files.pythonhosted.org/packages/4f/a7/fc647e9ce711cd630873c37219c0bd4438b8171211d813c7e6b316811e02/ipython-6.3.1.tar.gz"
    sha256 "a6ac981381b3f5f604b37a293369963485200e3639fb0404fa76092383c10c41"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz"
    sha256 "dbae1046def0efb574852fab9e90209b23f556367b5a320c0bcb871c77c3e8cc"
  end

  resource "traitlets" do
    url "https://files.pythonhosted.org/packages/a5/98/7f5ef2fe9e9e071813aaf9cb91d1a732e0a68b6c44a32b38cb8e14c3f069/traitlets-4.3.2.tar.gz"
    sha256 "9c4bd2d267b7153df9152698efb1050a5d84982d3384a37b2c1f7723ba3e7835"
  end

  resource "ipython_genutils" do
    url "https://files.pythonhosted.org/packages/e8/69/fbeffffc05236398ebfcfb512b6d2511c622871dca1746361006da310399/ipython_genutils-0.2.0.tar.gz"
    sha256 "eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8"
  end

  resource "decorator" do
    url "https://files.pythonhosted.org/packages/6f/24/15a229626c775aae5806312f6bf1e2a73785be3402c0acdec5dbddd8c11e/decorator-4.3.0.tar.gz"
    sha256 "c39efa13fbdeb4506c476c9b3babf6a718da943dab7811c206005a4a956c080c"
  end

  resource "pexpect" do
    url "https://files.pythonhosted.org/packages/09/0e/75f0c093654988b8f17416afb80f7621bcf7d36bbd6afb4f823acdb4bcdc/pexpect-4.5.0.tar.gz"
    sha256 "9f8eb3277716a01faafaba553d629d3d60a1a624c7cf45daa600d2148c30020c"
  end

  resource "ptyprocess" do
    url "https://files.pythonhosted.org/packages/51/83/5d07dc35534640b06f9d9f1a1d2bc2513fb9cc7595a1b0e28ae5477056ce/ptyprocess-0.5.2.tar.gz"
    sha256 "e64193f0047ad603b71f202332ab5527c5e52aa7c8b609704fc28c0dc20c4365"
  end

  resource "pickleshare" do
    url "https://files.pythonhosted.org/packages/69/fe/dd137d84daa0fd13a709e448138e310d9ea93070620c9db5454e234af525/pickleshare-0.7.4.tar.gz"
    sha256 "84a9257227dfdd6fe1b4be1319096c20eb85ff1e82c7932f36efccfe1b09737b"
  end

  resource "backcall" do
    url "https://files.pythonhosted.org/packages/84/71/c8ca4f5bb1e08401b916c68003acf0a0655df935d74d93bf3f3364b310e0/backcall-0.1.0.tar.gz"
    sha256 "38ecd85be2c1e78f77fd91700c76e14667dc21e2713b63876c0eb901196e01e4"
  end

  resource "prompt_toolkit" do
    url "https://files.pythonhosted.org/packages/8a/ad/cf6b128866e78ad6d7f1dc5b7f99885fb813393d9860778b2984582e81b5/prompt_toolkit-1.0.15.tar.gz"
    sha256 "858588f1983ca497f1cf4ffde01d978a3ea02b01c8a26a8bbc5cd2e66d816917"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/55/11/e4a2bb08bb450fdbd42cc709dd40de4ed2c472cf0ccb9e64af22279c5495/wcwidth-0.1.7.tar.gz"
    sha256 "3df37372226d6e63e1b1e1eda15c594bca98a22d33a23832a90998faa96bc65e"
  end

  resource "simplegeneric" do
    url "https://files.pythonhosted.org/packages/3d/57/4d9c9e3ae9a255cd4e1106bb57e24056d3d0709fc01b2e3e345898e49d5b/simplegeneric-0.8.1.zip"
    sha256 "dc972e06094b9af5b855b3df4a646395e43d1c9d0d39ed345b7393560d0b9173"
  end

  resource "ipywidgets" do
    url "https://files.pythonhosted.org/packages/18/8c/d19f7bef501c2cc217f52f7656eb98e04f236b1511192657de74a8abf6c1/ipywidgets-7.2.1.tar.gz"
    sha256 "ab9869cda5af7ba449d8f707b29b7e97a7db97d6366805d6b733338f51096f54"
  end

  resource "jupyter_client" do
    url "https://files.pythonhosted.org/packages/4c/df/1e8df7f4de63cc667a7a9aa234539c0419513bf94ac57d36d73b3b434786/jupyter_client-5.2.3.tar.gz"
    sha256 "27befcf0446b01e29853014d6a902dd101ad7d7f94e2252b1adca17c3466b761"
  end

  resource "pyzmq" do
    url "https://files.pythonhosted.org/packages/9f/f6/85a33a25128a4a812c3482547e3d458eebdb19ee0b4699f9199cdb2ad731/pyzmq-17.0.0.tar.gz"
    sha256 "0145ae59139b41f65e047a3a9ed11bbc36e37d5e96c64382fcdff911c4d8c3f0"
  end

  resource "jupyter_core" do
    url "https://files.pythonhosted.org/packages/b6/2d/2804f4de3a95583f65e5dcb4d7c8c7183124882323758996e867f47e72af/jupyter_core-4.4.0.tar.gz"
    sha256 "ba70754aa680300306c699790128f6fbd8c306ee5927976cbe48adacf240c0b7"
  end

  resource "ipykernel" do
    url "https://files.pythonhosted.org/packages/52/a6/8cfaaa3a1ccdebe7f3eabcf6969101e32dbdf14bfb2443d1c021130ce23c/ipykernel-4.8.2.tar.gz"
    sha256 "c091449dd0fad7710ddd9c4a06e8b9e15277da306590bc07a3a1afa6b4453c8f"
  end

  resource "tornado" do
    url "https://files.pythonhosted.org/packages/cf/d1/3be271ae5eba9fb59df63c9891fdc7d8044b999e8ac145994cdbfd2ae66a/tornado-5.0.2.tar.gz"
    sha256 "1b83d5c10550f2653380b4c77331d6f8850f287c4f67d7ce1e1c639d9222fbc7"
  end

  resource "pbr" do
    url "https://files.pythonhosted.org/packages/c6/46/f414e7d9ba9621c8acd3e7a82e08c47e0de34ad3e213c16e458b6c04d432/pbr-4.0.2.tar.gz"
    sha256 "dae4aaa78eafcad10ce2581fc34d694faa616727837fd8e55c1a00951ad6744f"
  end

  def install
    # Create a virtualenv in `libexec`. If your app needs Python 3, make sure that
    # `depends_on "python"` is declared, and use `virtualenv_create(libexec, "python")`.
    venv = virtualenv_create(libexec,"python3")
    # Install all of the resources declared on the formula into the virtualenv.
    venv.pip_install resources
    # `pip_install_and_link` takes a look at the virtualenv's bin directory
    # before and after installing its argument. New scripts will be symlinked
    # into `bin`. `pip_install_and_link buildpath` will install the package
    # that the formula points to, because buildpath is the location where the
    # formula's tarball was unpacked.
    # venv.pip_install_and_link buildpath
    prefix.install("pyport.patch")
  end
end
