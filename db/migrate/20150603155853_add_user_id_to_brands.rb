class AddUserIdToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :user_id, :integer
    add_index :brands, :user_id
  end
end
