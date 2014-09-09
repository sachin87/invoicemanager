json.array!(@currencies) do |currency|
  json.extract! currency, :id, :name, :country_id
  json.url currency_url(currency, format: :json)
end
