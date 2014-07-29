json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :currency, :email, :phone, :mobile, :website, :city, :state, :zipcode
  json.url user_url(user, format: :json)
end
