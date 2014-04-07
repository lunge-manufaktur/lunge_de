json.array!(@sizes) do |size|
  json.extract! size, :id, :name, :g1, :g1h
  json.url size_url(size, format: :json)
end
