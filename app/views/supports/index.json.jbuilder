json.array!(@supports) do |support|
  json.extract! support, :id, :subject, :message, :user_id
  json.url support_url(support, format: :json)
end
