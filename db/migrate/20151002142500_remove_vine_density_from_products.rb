class RemoveVineDensityFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :vine_density, :string
  end
end
