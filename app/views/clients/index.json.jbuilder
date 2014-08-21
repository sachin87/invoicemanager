json.array!(@clients) do |client|
  json.extract! client, :id, :first_name, :last_name, :currency_id, :email, :phone, :website_url, :street_address, :city, :state, :zipcode, :country_id
  json.url client_url(client, format: :json)
end
