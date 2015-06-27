require 'test_helper'
require 'minitest/metadata'
require 'pry'

class RundownerCanAddRecipeAccountTest < ActionDispatch::IntegrationTest
  let(:key_value) { 'somethingrandom' }
  let (:rundowner_key) { APIKey.new(key: key_value, consumer: 'rundowner') }
  before do
    rundowner_key.save!
  end
  let (:base_url) { '/api/v1/recipe_accounts?' }
  let (:authentication) { "&api-key=#{key_value}" }
  let (:the_data) do
    URI.encode_www_form('provider' => 'best_recipes.com',
                        'login_username' => 'foo.bar@baz.com',
                        'login_password' => 'top_sekret')
  end
  
  test 'validating the consumer' do
    assert key_value == rundowner_key.key
  end
  test 'adding a recipe account' do
    assert RecipeAccount.count == 0
    post URI.parse(base_url + the_data + authentication)
    assert RecipeAccount.count == 1
  end
  
end
