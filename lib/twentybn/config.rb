module TwentyBN
  private
  class << self
    attr_accessor :config
  end
end

TwentyBN.config = {
  api_url: "https://app.twentybn.com"
}
