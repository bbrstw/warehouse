json.array!(@accounts) do |account|
  json.extract! account, :id, :name, :description, :subdomain, :image
  json.url account_url(account, format: :json)
end
