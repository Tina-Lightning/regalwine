class AddVinificationMethodsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :vinification_methods, :text
  end
end
