class AddDetailsToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :website, :string
    add_column :brands, :country, :string
    add_column :brands, :region, :string
    add_column :brands, :appellation, :string
    add_column :brands, :varietal, :string
    add_column :brands, :soil_type, :string
    add_column :brands, :enologist, :string
    add_column :brands, :viticulturist, :string
    add_column :brands, :vineyard_size, :string
    add_column :brands, :total_production, :string
  end
end
