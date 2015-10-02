class RemoveMacerationFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :maceration, :string
  end
end
