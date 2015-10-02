class RemoveTotalProductionFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :total_production, :string
  end
end
