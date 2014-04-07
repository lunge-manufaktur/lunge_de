json.array!(@stocks) do |stock|
  json.extract! stock, :id, :product_id, :store_id, :g1
  json.url stock_url(stock, format: :json)
end
