class Order < ApplicationRecord
  belongs_to :product
  belongs_to :customer, class_name: "User"
  belongs_to :address
  belongs_to :shipper, class_name: "User"
end
