module PuppetMagnum

  INIT_FILE = '.puppet-magnum.init'
  VERSION = File.open(File.expand_path('../../../VERSION', __FILE__)).read.chomp

end
