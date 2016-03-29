require 'fileutils'

class Cleaner
  def self.run(path, config_path)
    FileUtils.rm_rf(path)
    FileUtils.rm_f(config_path)
  end
end
