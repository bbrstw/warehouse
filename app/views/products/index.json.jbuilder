json.array!(@products) do |product|
  json.extract! product, :id, :account_id, :name, :description, :sku, :code, :image, :cost, :cost, :weight, :weight, :weight_unit, :restock, :category_id, :supplier_id, :brand_id
  json.url product_url(product, format: :json)
end
