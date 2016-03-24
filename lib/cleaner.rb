require 'fileutils'

class Cleaner
  def self.run(path)
    FileUtils.rm_rf(path)
  end
end
