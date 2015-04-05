json.array!(@business_users) do |business_user|
  json.extract! business_user, :id
  json.url business_user_url(business_user, format: :json)
end
