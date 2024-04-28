#had to remove :images from extract, which was generated auto, bc otherwise two keys for images
json.extract! product, :id, :name, :cost, :created_at, :updated_at
json.url product_url(product, format: :json)
json.images do
  json.array!(product.images) do |image|
    json.id image.id
    json.url rails_blob_url(image)
  end
end
