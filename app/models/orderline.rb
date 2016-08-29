class Orderline < ActiveRecord::Base
  belongs_to :order, dependent: :destroy
  belongs_to :product, dependent: :destroy
  belongs_to :seller, class_name: "User"
end
