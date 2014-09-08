json.array!(@whouses) do |whouse|
  json.extract! whouse, :id, :account_id, :name, :code, :description
  json.url whouse_url(whouse, format: :json)
end
