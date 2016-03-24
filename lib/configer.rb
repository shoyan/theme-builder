require 'yaml'

module Configer
  VALID_OPTION_KEYS = %w(title email baseurl url permalink)
  attr_accessor(*VALID_OPTION_KEYS)

  def self.extended(base)
    base.reset
  end

  def configure
    yield self
  end

  def reset
    self.title = 'Your site title'
    self.email = 'your-email@domain.com'
    self.baseurl = ''
    self.url = "http://yourdomain.com"
    self.permalink = '/:title'
  end

  def build_config_file(option = {}, path='./tmp/_config.yml')
    config = VALID_OPTION_KEYS.each_with_object({}) do |key, arr|
      send("#{key}=", option[key]) if option.key?(key)
      arr[key] = send(key)
    end
    File.open(path, "w") do |f|
      f.puts config.to_yaml
    end
    path
  end
end
