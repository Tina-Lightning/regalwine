class AddDetailsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :appellation, :string
    add_column :products, :vineyard, :string
    add_column :products, :vineyard_size, :string
    add_column :products, :grape_varietals, :string
    add_column :products, :clones, :string
    add_column :products, :soil, :text
    add_column :products, :plot_characteristics, :text
    add_column :products, :yield, :string
    add_column :products, :vine_density, :string
    add_column :products, :age_of_vines, :string
    add_column :products, :vineyard_practices, :string
    add_column :products, :harvest, :string
    add_column :products, :fermentation, :text
    add_column :products, :yeast, :string
    add_column :products, :maceration, :string
    add_column :products, :malolactic_fermentation, :string
    add_column :products, :aging, :text
    add_column :products, :filtration, :string
    add_column :products, :total_production, :string
    add_column :products, :accolades, :text
    add_column :products, :beverage_tax_code, :string
    add_column :products, :producer, :string
    add_column :products, :nj_brand_number, :string
    add_column :products, :ttb_number, :string
    add_column :products, :additional_upc_code, :string
    add_column :products, :bottle_size, :string
  end
end
