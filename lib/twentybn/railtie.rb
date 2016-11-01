module TwentyBN
  class Railtie < Rails::Railtie

  end
end

require 'twentybn/railtie' if defined?(Rails)
