class RemoveTtbNumberFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :ttb_number, :string
  end
end
