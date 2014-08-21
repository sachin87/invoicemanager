json.array!(@categories) do |category|
  json.extract! category, :id, :name, :description, :unit_price, :unit
  json.url category_url(category, format: :json)
end
