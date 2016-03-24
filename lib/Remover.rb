require 'fileutils'

class Remover
  def self.run(path)
    FileUtils.rm_rf(path)
  end
end
