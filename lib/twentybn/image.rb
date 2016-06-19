require 'faraday'
require 'json'
require 'base64'

API_URL = "https://app.twentybn.com"

module TwentyBN

  class Image

    def initialize(image)
      @image = image
    end

    def ask(question)
      response = api_connection.post do |reqest|
        reqest.headers['Content-Type'] = 'application/json'
        reqest.headers['api_key'] = "1234"
        data = {
          image: self.image_base64,
          question: question,
        }
        reqest.url '/v1/image.json'
        reqest.body = JSON.generate(data)
      end
      return response.body
    end

    def image_base64
      Base64.strict_encode64(IO.binread(@image))
    end

    def api_connection
      @api_connection ||= Faraday.new(url: API_URL) do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
    end

  end

end
