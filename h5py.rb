class H5py < Formula
  desc "Pythonic interface to the HDF5 binary data format"
  homepage "http://www.h5py.org"
  url "https://pypi.python.org/packages/41/7a/6048de44c62fc5e618178ef9888850c3773a9e4be249e5e673ebce0402ff/h5py-2.7.1.tar.gz"
  sha256 "180a688311e826ff6ae6d3bda9b5c292b90b28787525ddfcb10a29d5ddcae2cc"

  depends_on "python@2" => :recommended
  depends_on "python" => :recommended
  depends_on "hdf5"

  resource "cython" do
    url "https://pypi.python.org/packages/fa/86/0c8311bcba3b3f0944c135db95312e057a353058f522692e4dcf6d4bb978/Cython-0.28.tar.gz"
    sha256 "518f7e22da54109661e483a91a63045203caf9fd78da4a69185a7622f759965f"
  end

  resource "six" do
    url "https://pypi.python.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz#md5=d12789f9baf7e9fb2524c0c64f1773f8"
    sha256 "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
  end

  def install
    Language::Python.each_python(build) do |python, version|
      ENV.prepend_create_path "PATH", buildpath/"vendor/bin"
      ENV.prepend_create_path "PYTHONPATH", buildpath/"vendor/lib/python#{version}/site-packages"
      resource("cython").stage do
        system python, *Language::Python.setup_install_args(buildpath/"vendor")
      end

      bundle_path = libexec/"lib/python#{version}/site-packages"
      ENV.prepend_create_path "PYTHONPATH", bundle_path
      resource("six").stage do
        system python, *Language::Python.setup_install_args(libexec)
      end
      (lib/"python#{version}/site-packages/homebrew-h5py-bundle.pth").write "#{bundle_path}\n"

      args = Language::Python.setup_install_args(prefix)
      args << "configure"
      args << "--hdf5=#{Formula["hdf5"].opt_prefix}"
      ENV.prepend_create_path "PYTHONPATH", lib/"python#{version}/site-packages"
      system python, *args
    end
  end

  test do
    Language::Python.each_python(build) do |python, _|
      system python, "-c", "import h5py; print(h5py.__version__)"
    end
  end
end
