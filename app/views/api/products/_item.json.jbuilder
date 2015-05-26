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
json.product_images product.product_images do |image|
  json.id image.id
  json.url image.image.url
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
  json.g1 stock.g1
  json.g1h stock.g1h
  json.g2 stock.g2
  json.g2h stock.g2h
  json.g3 stock.g3
  json.g3h stock.g3h
  json.g4 stock.g4
  json.g4h stock.g4h
  json.g5 stock.g5
  json.g5h stock.g5h
  json.g6 stock.g6
  json.g6h stock.g6h
  json.g7 stock.g7
  json.g7h stock.g7h
  json.g8 stock.g8
  json.g8h stock.g8h
  json.g9 stock.g9
  json.g9h stock.g9h
  json.g10 stock.g10
  json.g10h stock.g10h
  json.g11 stock.g11
  json.g11h stock.g11h
  json.g12 stock.g12
  json.g12h stock.g12h
  json.g13 stock.g13
  json.g13h stock.g13h
  json.g14 stock.g14
  json.g14h stock.g14h
  json.g15 stock.g15
  json.g16 stock.g16
  json.g17 stock.g17
  json.g18 stock.g18
  json.g19 stock.g19
end