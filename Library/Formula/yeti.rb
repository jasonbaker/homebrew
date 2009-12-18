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

    bin.mkdir
    yeti_exec = bin + 'yeti'

    script = DATA.read
    script.sub! "YETI_JAR_PATH_PLACEHOLDER", "#{prefix}/#{JAR}"

    yeti_exec.write script

    File.chmod(0755, yeti_exec)
  end
end


__END__
#!/bin/sh

YETI=YETI_JAR_PATH_PLACEHOLDER
java -server -jar $YETI $@


