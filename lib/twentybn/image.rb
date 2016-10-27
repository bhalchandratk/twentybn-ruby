require 'faraday'
require 'json'
require 'base64'

module TwentyBN

  def self.api_key=(api_key)
    config[:api_key] = api_key.to_s
  end

  def self.image(image)
    Image.new(image)
  end

  class Image

    def initialize(image)
      @image = image
    end

    def ask(question)
      response = api_connection.post do |request|
        request.headers['Content-Type'] = 'application/json'
        request.headers['X-ApiKey'] = TwentyBN.config[:api_key]
        data = {
          content: self.image_base64,
          question: question,
        }
        request.url '/v1/vqa'
        request.body = JSON.generate(data)
      end
      return response.body
    end

    def tag(model=:objects)
      response = api_connection.post do |request|
        request.headers['Content-Type'] = 'application/json'
        request.headers['X-ApiKey'] = TwentyBN.config[:api_key]
        data = {
          content: self.image_base64,
        }
        default_models = [:objects, :places, :categories]
        if default_models.include? model
          request.url "/v1/tag_image"
          request.params['model'] = model
        else
          request.url '/v1/custom_tag_image'
          data[:modelId] = model
        end
        request.body = JSON.generate(data)
      end
      return response.body
    end

    def image_base64
      Base64.strict_encode64(IO.binread(@image))
    end

    def api_connection
      @api_connection ||= Faraday.new(url: TwentyBN.config[:api_url]) do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
    end

  end

end
