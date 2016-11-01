module TwentyBN

  require 'rails'

  class Railtie < Rails::Railtie
    initializer 'twentybn' do |app|
      api_key = app.config.respond_to?(:twentybn_api_key) ? app.config.twentybn_api_key : ""
      TwentyBN.api_key = api_key
    end
  end

end
