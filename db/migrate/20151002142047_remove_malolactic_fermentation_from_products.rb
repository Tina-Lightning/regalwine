class RemoveMalolacticFermentationFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :malolactic_fermentation, :string
  end
end
