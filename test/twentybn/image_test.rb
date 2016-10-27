require './test/test_helper'

class ImageTest < Minitest::Test

  TwentyBN.api_key = 'YOUR_API_KEY'

  def test_tag_with_objects
    VCR.use_cassette('tag_objects') do

      response = TwentyBN.image("./test/fixtures/files/test_image.jpg").tag
      result = JSON.parse(response)['result']

      tag_result_fixture = YAML.load_file('./test/fixtures/results.yml')['tag_objects_result']

      assert_equal result['scores'], tag_result_fixture['scores']
      assert_equal result['tags'], tag_result_fixture['tags']
    end
  end

  def test_tag_with_places
    VCR.use_cassette('tag_places') do

      response = TwentyBN.image("./test/fixtures/files/test_image.jpg").tag(:places)
      result = JSON.parse(response)['result']

      tag_result_fixture = YAML.load_file('./test/fixtures/results.yml')['tag_places_result']

      assert_equal result['scores'], tag_result_fixture['scores']
      assert_equal result['tags'], tag_result_fixture['tags']
    end
  end

  def test_tag_with_categories
    VCR.use_cassette('tag_categories') do

      response = TwentyBN.image("./test/fixtures/files/test_image.jpg").tag(:categories)
      result = JSON.parse(response)['result']

      tag_result_fixture = YAML.load_file('./test/fixtures/results.yml')['tag_categories_result']

      assert_equal result['scores'], tag_result_fixture['scores']
      assert_equal result['tags'], tag_result_fixture['tags']
    end
  end

  def test_tag_with_custom_classifier
    VCR.use_cassette('tag_custom') do

      response = TwentyBN.image("./test/fixtures/files/test_image.jpg").tag("9b80ddb9-2d02-436f-86ba-f9a3e679de7a")
      result = JSON.parse(response)['result']

      tag_result_fixture = YAML.load_file('./test/fixtures/results.yml')['tag_custom_result']

      assert_equal result['scores'], tag_result_fixture['scores']
      assert_equal result['tags'], tag_result_fixture['tags']
    end
  end

  def test_ask
    VCR.use_cassette('ask') do

      question = "What is the dog doing?"
      response = TwentyBN.image("./test/fixtures/files/test_image.jpg").ask(question)
      result = JSON.parse(response)['result']

      ask_result_fixture = YAML.load_file('./test/fixtures/results.yml')['ask_result']

      assert_equal result['scores'], ask_result_fixture['scores']
      assert_equal result['answers'], ask_result_fixture['answers']
    end
  end
end
