module Configer
  VALID_OPTION_KEYS = %w(build_dir config_dir download_dir theme)
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
    self.theme = 'themes/default'
  end
end
