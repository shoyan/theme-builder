module Configer
  VALID_OPTION_KEYS = %w(build_dir config_dir download_dir clean delivery_dir)
  attr_accessor(*VALID_OPTION_KEYS)

  def self.extended(base)
    base.reset
  end

  def configure
    yield self
  end

  def reset
    self.build_dir = 'public/sites/'
    self.config_dir = 'tmp/'
    self.download_dir = 'downloads/'
    self.clean = false
    self.delivery_dir = 'public-html'
  end
end
