json.id product.id
json.created_at product.created_at
json.updated_at product.updated_at
json.published product.is_published
json.url product_url(product)
json.name product.name
json.color product.color
json.sku product.sku
json.description product.description
json.current_price product.current_price
json.regular_price product.regular_price
json.brand do
  json.id product.try(:brand).try(:id)
  json.name product.try(:brand).try(:name)
end
json.size_set do |size|
  json.id product.try(:size).try(:id)
  json.name product.try(:size).try(:name)
end
json.availability product.stocks do |stock|
  json.id stock.id
  json.store do
    json.id stock.store_id 
    json.short_name stock.store.name
    json.full_address stock.store.full_address
    json.latitude stock.store.latitude
    json.longitude stock.store.longitude
  end
  json.g1 stock.has_stock?("g1")
  json.g1h stock.has_stock?("g1h")
  json.g2 stock.has_stock?("g2")
  json.g2h stock.has_stock?("g2h")
  json.g3 stock.has_stock?("g3")
  json.g3h stock.has_stock?("g3h")
  json.g4 stock.has_stock?("g4")
  json.g4h stock.has_stock?("g4h")
  json.g5 stock.has_stock?("g5")
  json.g5h stock.has_stock?("g5h")
  json.g6 stock.has_stock?("g6")
  json.g6h stock.has_stock?("g6h")
  json.g7 stock.has_stock?("g7")
  json.g7h stock.has_stock?("g7h")
  json.g8 stock.has_stock?("g8")
  json.g8h stock.has_stock?("g8h")
  json.g9 stock.has_stock?("g9")
  json.g9h stock.has_stock?("g9h")
  json.g10 stock.has_stock?("g10")
  json.g10h stock.has_stock?("g10h")
  json.g11 stock.has_stock?("g11")
  json.g11h stock.has_stock?("g11h")
  json.g12 stock.has_stock?("g12")
  json.g12h stock.has_stock?("g12h")
  json.g13 stock.has_stock?("g13")
  json.g13h stock.has_stock?("g13h")
  json.g14 stock.has_stock?("g14")
  json.g14h stock.has_stock?("g14h")
  json.g15 stock.has_stock?("g15")
  json.g16 stock.has_stock?("g16")
  json.g17 stock.has_stock?("g17")
  json.g18 stock.has_stock?("g18")
  json.g19 stock.has_stock?("g19")
end