class H5py < Formula
  desc "Pythonic interface to the HDF5 binary data format"
  homepage "http://www.h5py.org"
  url "https://github.com/h5py/h5py/archive/2.6.0.tar.gz"
  sha256 "7fec1d6f19418b3a624bbb90c7baa105952c0bb6cfbb6676f436fac44fc6ccfb"

  option "without-python", "Build without python2 support"
  depends_on :python => :recommended if MacOS.version <= :snow_leopard
  depends_on :python3 => :optional

  depends_on :mpi => :optional
  depends_on "homebrew/science/hdf5" => ["with-mpi"] if build.with? :mpi

  if build.with? :mpi
    depends_on "mpi4py" => ["with-python3"] if build.with? :python3
  end

  if build.with? :python3
    depends_on "homebrew/python/numpy" => ["with-python3"]
  end

  resource "cython" do
    url "https://pypi.python.org/packages/b1/51/bd5ef7dff3ae02a2c6047aa18d3d06df2fb8a40b00e938e7ea2f75544cac/Cython-0.24.tar.gz"
    sha256 "6de44d8c482128efc12334641347a9c3e5098d807dd3c69e867fa8f84ec2a3f1"
  end

  def install
    Language::Python.each_python(build) do |python, version|
      ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{version}/site-packages"
      resource("cython").stage do
        system python, *Language::Python.setup_install_args(libexec/"vendor")
      end

      args = ["configure", "--hdf5=#{Formula["homebrew/science/hdf5"].opt_prefix}"]
      args << "--mpi" if build.with? :mpi

      ENV.prepend_create_path "PYTHONPATH", lib/"python#{version}/site-packages"
      system python, *Language::Python.setup_install_args(prefix), *args
    end
  end

  test do
    Language::Python.each_python(build) do |python, _|
      system python, "-c", "\"import h5py; print(h5py.__version__)\""
    end
  end
end
