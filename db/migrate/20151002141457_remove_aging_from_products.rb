class RemoveAgingFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :aging, :string
  end
end
