class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_type
      t.string :product_subtype
      t.string :string
      t.string :vintage
      t.string :country
      t.string :region
      t.text :description
      t.references :brand, index: true

      t.timestamps null: false
    end
    add_foreign_key :products, :brands
  end
end
