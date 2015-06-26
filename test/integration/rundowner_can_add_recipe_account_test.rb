require 'test_helper'
require 'minitest/metadata'
require 'pry'

class RundownerCanAddRecipeAccountTest < ActionDispatch::IntegrationTest
  let(:key_value) { 'somethingrandom' }
  let (:rundowner_key) { APIKey.new(key: key_value, consumer: 'rundowner') }
  
  test "validating the consumer" do
    assert key_value == rundowner_key.key
  end
  
end
