module TwentyBN
  class << self
    attr_accessor :config
  end
end

TwentyBN.config = {
  api_url: "https://cortex.twentybn.com"
}
