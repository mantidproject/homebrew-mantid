class MantidDeveloper < Formula
        # get the pyport.patch file as we need it later and just because we have to have one
	# this is really a metapackage only
	url 'https://raw.githubusercontent.com/mantidproject/mantid/master/buildconfig/pyport.patch' #:using => :curl
	homepage "https://github.com/mantidproject/mantid/wiki/Building-Mantid-on-OS-X-10.9-&-10.10-using-clang-and-Xcode"
	version '1.1'
        sha256 "e9f83c057e70082c48f5576d3e7d0d257f55f1835ce659239c64445bb01da551"

        depends_on "openssl"
	depends_on "qt@4"
	depends_on "cmake"
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
        depends_on "python@2" => :optional
        depends_on "python" => :recommended
        depends_on "numpy"
        depends_on "scipy"
        depends_on "freetype"

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/dc/8c/7c9869454bdc53e72fb87ace63eac39336879eef6f2bf96e946edbf03e90/setuptools-33.1.1.zip"
    sha256 "6b20352ed60ba08c43b3611bdb502286f7a869fbfcf472f40d7279f1e77de145"
  end

  resource "Cycler" do
    url "https://files.pythonhosted.org/packages/c2/4b/137dea450d6e1e3d474e1d873cd1d4f7d3beed7e0dc973b06e8e10d32488/cycler-0.10.0.tar.gz"
    sha256 "cd7b2d1018258d7247a71425e9f26463dfb444d411c39569972f4ce586b0c9d8"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/38/bb/bf325351dd8ab6eb3c3b7c07c3978f38b2103e2ab48d59726916907cd6fb/pyparsing-2.1.10.tar.gz"
    sha256 "811c3e7b0031021137fc83e051795025fcb98674d07eb8fe922ba4de53d39188"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/51/fc/39a3fbde6864942e8bb24c93663734b74e281b984d1b8c4f95d64b0c21f6/python-dateutil-2.6.0.tar.gz"
    sha256 "62a2f8df3d66f878373fd0072eacf4ee52194ba302e00082828e0d263b0418d2"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/d0/e1/aca6ef73a7bd322a7fc73fd99631ee3454d4fc67dc2bee463e2adf6bb3d3/pytz-2016.10.tar.bz2"
    sha256 "7016b2c4fa075c564b81c37a252a5fccf60d8964aa31b7f5eae59aeb594ae02b"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz"
    sha256 "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"
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

  def install
    xy = Language::Python.major_minor_version "python3"
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
    resources.each do |r|
      r.stage do
        system "python3", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"

    prefix.install("pyport.patch")
  end
end

