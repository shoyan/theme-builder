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

    path = BuildConfiguration.build_config_file(option[:config], "./tmp/_config_#{file_name}.yml")
    build(source: "themes/default", destination: "#{build_dir}/#{file_name}", config: path)
    Compressor.run("#{build_dir}/#{file_name}.tar.gz", "#{build_dir}/#{file_name}")
    Remover.run("#{build_dir}/#{file_name}")
    "/downloads/#{build_dir}/#{file_name}.tar.gz"
  end

  def build(args)
    Jekyll::Commands::Build.process(args)
  end

  def file_name
    @file_name || @file_name = SecureRandom.hex
  end

  def build_dir
    @build_dir || @build_dir = "#{Builder.build_dir}#{Date.today.to_s}"
  end

  class << self
    def run(option)
      new.run(option)
    end
  end
end
