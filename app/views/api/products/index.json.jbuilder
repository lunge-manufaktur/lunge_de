json.products @products do |product|
  json.partial! "item", product: product
end