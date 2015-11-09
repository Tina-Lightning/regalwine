class AddCaseCardToProducts < ActiveRecord::Migration
  def change
    add_column :products, :case_card, :string
  end
end
