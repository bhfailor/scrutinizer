require 'test_helper'
require 'minitest/metadata'
require 'pry'

class RundownerCanAddRecipeAccountTest < ActionDispatch::IntegrationTest
  let(:key_value) { 'somethingrandom' }
  let (:base_url) { '/api/v1/recipe_accounts?' }
  let (:authentication) { "&api-key=#{key_value}" }
  let (:the_data) do
    URI.encode_www_form('provider' => 'best_recipes.com',
                        'login_username' => 'foo.bar@baz.com',
                        'login_password' => 'top_sekret')
  end

  class UnauthenticatedConsumer < RundownerCanAddRecipeAccountTest
    let (:bogus_authentication) { "&api-key=#{'bogus'}" }
    let (:assert_unauthorized) do
      lambda do
        assert response.status == 401
        assert JSON.parse(response.body) == { 'error' => 'Unauthorized' }
      end
    end
        
    test 'authenticating a request without an api key' do
      post  URI.parse(base_url + the_data)
      assert_unauthorized.call
    end

    test 'authenticating a request with bogus api key' do
      post URI.parse(base_url + the_data + bogus_authentication)
      assert_unauthorized.call
    end
    
  end
  
  class AuthenticatedConsumer < RundownerCanAddRecipeAccountTest
  let (:rundowner_key) { APIKey.new(key: key_value, consumer: 'rundowner') }

    before do
      rundowner_key.save!
    end

    test 'adding a recipe account' do
      assert RecipeAccount.count == 0
      post URI.parse(base_url + the_data + authentication)
      assert RecipeAccount.count == 1
    end
  end

end
