class Order < ActiveRecord::Base
	validates :address, :city, :state, presence: true

		has_many :orderlines

		belongs_to :buyer, class_name: "User"
end
