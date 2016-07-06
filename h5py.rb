class H5py < Formula
  desc "Pythonic interface to the HDF5 binary data format"
  homepage "http://www.h5py.org"
  url "https://github.com/h5py/h5py/archive/2.6.0.tar.gz"
  version "2.6.0"
  sha256 "7fec1d6f19418b3a624bbb90c7baa105952c0bb6cfbb6676f436fac44fc6ccfb"

  depends_on "hdf5"

  resource "cython" do
    url "http://cython.org/release/Cython-0.24.tar.gz"
    sha256 ""
  end

  def install
    system "python", "setup.py", "configure", "--hdf5=#{Formula["homebrew/science/hdf5"].opt_prefix}", "build"
    system "python", *Language::Python.setup_install_args(prefix)
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test h5py`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
