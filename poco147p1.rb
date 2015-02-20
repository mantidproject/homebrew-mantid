require "formula"

class Poco147p1 < Formula
  homepage "http://pocoproject.org/"
  url "http://pocoproject.org/releases/poco-1.4.7/poco-1.4.7p1-all.tar.bz2"
  sha1 "29339fe4b9318d7f358f400e0847856a27ea6c4a"

  option :cxx11

  depends_on "openssl"

  def install
    ENV.cxx11 if build.cxx11?

    arch = Hardware.is_64_bit? ? 'Darwin64': 'Darwin32'
    system "./configure", "--prefix=#{prefix}",
                          "--config=#{arch}",
                          "--omit=Data/MySQL,Data/ODBC",
                          "--no-samples",
                          "--no-tests"
    system "make", "install", "CC=#{ENV.cc}", "CXX=#{ENV.cxx}"
  end
end
