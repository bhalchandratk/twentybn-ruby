module TwentyBN
  class Railtie < Rails::Railtie
    require 'rails'

    initializer 'twentybn' do |app|
      TwentyBN.api_key = app.config.twentybn_api_key
    end
  end
end

require 'twentybn/railtie' if defined?(Rails)
