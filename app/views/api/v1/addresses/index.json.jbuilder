json.addresses do
    json.array! @addresses, partial: "api/v1/addresses/address", as: :address
end
