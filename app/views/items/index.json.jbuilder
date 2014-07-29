json.array!(@items) do |item|
  json.extract! item, :id, :description, :quantity, :rate, :amount, :date, :link, :tag_list, :file
  json.url item_url(item, format: :json)
end
