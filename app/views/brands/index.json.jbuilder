json.array!(@brands) do |brand|
  json.extract! brand, :id, :name, :description, :viticulture
  json.url brand_url(brand, format: :json)
end
