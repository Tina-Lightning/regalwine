class RemoveBeverageTaxCodeFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :beverage_tax_code, :string
  end
end
