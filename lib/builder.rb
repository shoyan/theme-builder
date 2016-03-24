require 'securerandom'
require 'date'
require 'jekyll'
require './lib/compressor'
require './lib/remover'
require './lib/configer'
require './lib/build_configuration'

class Builder
  extend Configer

  def run(option)
    Dir.mkdir build_dir unless Dir.exist?(build_dir)
    path = BuildConfiguration.build_config_file(
      option[:config],
      "#{Builder.config_dir}_config_#{unique_name}.yml")
    build(source: Builder.theme,
          destination: destination,
          config: path)
    Compressor.run(archived_file_name, destination)
    Remover.run(destination)
    "#{Builder.download_dir}#{archived_file_name}"
  end

  def build(args)
    Jekyll::Commands::Build.process(args)
  end

  def unique_name
    @unique_name || @unique_name = SecureRandom.hex
  end

  def build_dir
    @build_dir || @build_dir = "#{Builder.build_dir}#{Date.today.to_s}/"
  end

  def destination
    "#{build_dir}#{unique_name}"
  end

  def archived_file_name
    "#{destination}.tar.gz"
  end

  class << self
    def run(option)
      new.run(option)
    end
  end
end
