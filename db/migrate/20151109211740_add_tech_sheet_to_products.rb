class AddTechSheetToProducts < ActiveRecord::Migration
  def change
    add_column :products, :tech_sheet, :string
  end
end
