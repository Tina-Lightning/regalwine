json.array!(@products) do |product|
  json.extract! product, :id, :name, :product_type, :product_subtype, :string, :vintage, :country, :region, :description, :brand_id
  json.url product_url(product, format: :json)
end
