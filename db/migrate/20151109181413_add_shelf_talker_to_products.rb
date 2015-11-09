class AddShelfTalkerToProducts < ActiveRecord::Migration
  def change
    add_column :products, :shelf_talker, :string
  end
end
