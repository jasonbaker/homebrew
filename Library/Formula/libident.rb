require 'formula'

class Libident <Formula
  url 'http://www.remlab.net/files/libident/libident-0.32.tar.gz'
  homepage 'http://www.remlab.net/libident/'
  md5 '9b9346eacc28d842d164881f0efa3388'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end
