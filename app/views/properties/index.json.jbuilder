json.array!(@properties) do |property|
  json.extract! attribute, :id, :product_id, :name, :value
  json.url property_url(property, format: :json)
end
