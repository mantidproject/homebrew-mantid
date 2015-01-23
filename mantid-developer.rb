require 'formula'

class MantidDeveloper < Formula
	# get the pyport.patch file as we need it later and just because we have to have one 
	# this is really a metapackage only
	url 'https://raw.githubusercontent.com/mantidproject/mantid/master/Code/Mantid/Build/pyport.patch' #:using => :curl
	homepage "https://github.com/mantidproject/mantid/wiki/Building-Mantid-on-OS-X-10.9-&-10.10-using-clang-and-Xcode"
	version '1.1'

#	depends_on "qt" => "with-qt3support"
	depends_on "cmake"
#	depends_on "sip" => "build-from-source"
#	depends_on "pyqt" => "build-from-source"
#	depends_on "qscintilla2" => "build-from-source"
#	depends_on "poco" => "c++11"
#	depends_on "boost" => "c++11"
#	depends_on "boost-python" => "c++11"
#	depends_on "gsl"
#	depends_on "hdf5" => ["with-cxx", "c++11", "with-fortran", "with-fortran2003", "without-check"]
#	depends_on "libmxml"
	depends_on "muparser"
#	depends_on "nexusformat" => "c++11"
	depends_on "jsoncpp"
#	depends_on "oce" => "without-tbb"
#	depends_on "openssl"
#	depends_on "qwt5"
#	depends_on "qwtplot3d"
#	depends_on "google-perftools"

	# Now let's see if we can install some python stuff
	# Not sure how best to check if these are already installed! 

	resource "pip" do 
		url 'https://pypi.python.org/packages/source/p/pip/pip-6.0.6.tar.gz'
		md5 'bbb17814bdf82187f46aaf9cec6b6caa'
	end

	resource "sphinx" do
		url 'https://pypi.python.org/packages/source/S/Sphinx/Sphinx-1.3b2.tar.gz'
		md5 '7ea36c45e795fd49185f8d4c075f6b62'
	end

	resource "ipython" do 
		url 'https://pypi.python.org/packages/source/i/ipython/ipython-1.1.0.tar.gz'
		md5 '70d69c78122923879232567ac3c47cef'
	end

	resource "pygments" do 
		url 'https://pypi.python.org/packages/source/P/Pygments/Pygments-2.0.2.tar.gz'
		md5 '238587a1370d62405edabd0794b3ec4a'
	end

	resource "pyzmq" do 
		url 'https://pypi.python.org/packages/source/p/pyzmq/pyzmq-14.5.0.tar.gz'
		md5 '8d3351a8ca2ca2a272a3f96bcb963e41'
	end

	resource "sphinx_bootstrap_theme" do 
		url 'https://pypi.python.org/packages/source/s/sphinx-bootstrap-theme/sphinx-bootstrap-theme-0.4.5.tar.gz'
		md5 '06ca1cb93aa7372e02815d43419b269c'
	end

	def install 
		ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
		%w[sphinx ipython pygments pyzmq sphinx_bootstrap_theme].each do |r|
			resource(r).stage do
				system "python", *Language::Python.setup_install_args(libexec/"vendor")
			end
		end
		
		ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    	system "python", *Language::Python.setup_install_args(libexec)

    	bin.install Dir["#{libexec}/bin/*"]
    	bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
    end

end

