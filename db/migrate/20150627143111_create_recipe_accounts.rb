class CreateRecipeAccounts < ActiveRecord::Migration
  def change
    create_table :recipe_accounts do |t|
      t.string :login_username
      t.string :login_password
      t.string :provider
    end
  end
end
