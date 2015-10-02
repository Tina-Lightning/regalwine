class RemoveVineyardSizeFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :vineyard_size, :string
  end
end
