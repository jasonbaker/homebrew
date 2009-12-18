require 'formula'

class Yeti <Formula
  homepage 'http://mth.github.com/yeti/'
  md5 'd11756e552d0a15a007ed3403d0d86e1'
  head 'git://github.com/mth/yeti.git'
  version 'HEAD'
  JAR = 'yeti.jar'

  def install
    system 'ant'
    system 'ant jar'
    prefix.install JAR
    
    yeti_exec = (bin+'yeti')
    yeti_exec.write DATA.read
    File.chmod(0755, yeti_exec)
  end
end

__END__
#!/bin/sh

YETI=#{prefix}/#{JAR}
java -server -jar $YETI $@
