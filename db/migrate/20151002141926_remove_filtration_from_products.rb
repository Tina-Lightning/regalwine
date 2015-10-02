class RemoveFiltrationFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :filtration, :string
  end
end
