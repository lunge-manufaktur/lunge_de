json.array!(@stores) do |store|
  json.extract! store, :id, :name, :address_name, :street, :zip, :city, :phone, :email, :active
  json.url store_url(store, format: :json)
end
