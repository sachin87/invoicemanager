json.array!(@entries) do |entry|
  json.extract! entry, :id, :name, :date, :client, :description, :hours, :file, :link, :tag_list
  json.url entry_url(entry, format: :json)
end
