class RemoveNjBrandNumberFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :nj_brand_number, :string
  end
end
