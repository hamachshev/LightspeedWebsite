json.extract! address, :id, :name, :address_line1, :address_line2, :zone_code, :zipcode, :country_code, :created_at, :updated_at
json.url api_v1_address_url(address, format: :json)
