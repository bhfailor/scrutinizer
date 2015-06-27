class API::V1::RecipeAccountsController < ApplicationController
  def create
    ra = RecipeAccount.new(recipe_account_params)
    if ra.save
      # render something back
    else
      # render something else back
    end
  end

  private

  def recipe_account_params
    params.permit(:provider, :login_username, :login_password)
  end
  
end
