require 'yaml'

class BuildConfiguration
  DEFAULTS = {
    'title'   => 'Your site title',
    'email'   => 'your-email@domain.com',
    'baseurl' => '',
    'url'     => 'http://yourdomain.com',
    'permalink' => '/:title'
  }

  class << self
    def default_option
      DEFAULTS
    end

    def build_config_file(option = {}, path='./tmp/_config.yml')
      config = DEFAULTS.each_with_object({}) do |(key, val), arr|
        arr[key] = if option.key?(key)
                     option[key]
                   else
                     val
                   end
      end
      File.open(path, "w") do |f|
        f.puts config.to_yaml
      end
      path
    end
  end
end
