class H5py < Formula
  desc "Pythonic interface to the HDF5 binary data format"
  homepage "http://www.h5py.org"
  url "https://github.com/h5py/h5py/archive/2.6.0.tar.gz"
  version "2.6.0"
  sha256 "7fec1d6f19418b3a624bbb90c7baa105952c0bb6cfbb6676f436fac44fc6ccfb"

  depends_on "hdf5"

  resource "cython" do
    url "https://pypi.python.org/packages/b1/51/bd5ef7dff3ae02a2c6047aa18d3d06df2fb8a40b00e938e7ea2f75544cac/Cython-0.24.tar.gz"
    sha256 "6de44d8c482128efc12334641347a9c3e5098d807dd3c69e867fa8f84ec2a3f1"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", buildpath+"lib/python2.7/site-packages"
    resource("cython").stage do
      system "python", "setup.py", "build", "install", "--prefix=#{buildpath}"
    end

    system "python", "setup.py", "configure", "--hdf5=#{Formula["homebrew/science/hdf5"].opt_prefix}", "build"
    system "python", *Language::Python.setup_install_args(prefix)
  end

  test do
    system "python -c \"import h5py; print(h5py.__version__)\""
  end
end
