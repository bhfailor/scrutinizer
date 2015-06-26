class CreateAPIKeyTable < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :key
      t.string :consumer
    end
    add_index :api_keys, :key
  end
end
