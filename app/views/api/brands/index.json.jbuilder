json.brands @brands do |brand|
  json.partial! "item", brand: brand
end