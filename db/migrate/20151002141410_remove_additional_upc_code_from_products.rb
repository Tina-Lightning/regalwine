class RemoveAdditionalUpcCodeFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :additional_upc_code, :string
  end
end
