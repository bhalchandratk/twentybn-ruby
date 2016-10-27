require './lib/twentybn'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures/vcr_cassettes"
  c.hook_into :webmock
end
