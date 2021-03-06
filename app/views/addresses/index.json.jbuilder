json.array!(@addresses) do |address|
  json.extract! address, :id, :address, :zipcode, :city, :phone
  json.url address_url(address, format: :json)
end
