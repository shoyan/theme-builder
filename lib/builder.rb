require 'securerandom'
require 'date'
require 'jekyll'
require './lib/compressor'
require './lib/remover'
require './lib/configer'

class Builder
  extend Configer

  def run(option)
    file_name = build_file_name
    sub_dir   = build_sub_dir
    Dir.mkdir "public/sites/#{sub_dir}" unless Dir.exist?("public/sites/#{sub_dir}")

    path = Builder.build_config_file(option[:config], "./tmp/_config_#{file_name}.yml")
    build(source: "themes/default", destination: "public/sites/#{sub_dir}/#{file_name}", config: path)
    Compressor.run("public/sites/#{sub_dir}/#{file_name}.tar.gz", "public/sites/#{sub_dir}/#{file_name}")
    Remover.run("public/sites/#{sub_dir}/#{file_name}")
    "/downloads/#{sub_dir}/#{file_name}.tar.gz"
  end

  def build(args)
    Jekyll::Commands::Build.process(args)
  end

  def build_file_name
    SecureRandom.hex
  end

  def build_sub_dir
    Date.today.to_s
  end

  class << self
    def run(option)
      new.run(option)
    end
  end
end
