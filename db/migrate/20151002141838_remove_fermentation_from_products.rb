class RemoveFermentationFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :fermentation, :text
  end
end
