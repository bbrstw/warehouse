json.array!(@suppliers) do |supplier|
  json.extract! supplier, :id, :name, :phone, :address1, :address2, :city, :state, :zip
  json.url supplier_url(supplier, format: :json)
end
