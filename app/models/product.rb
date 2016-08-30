class Product < ActiveRecord::Base
	searchkick
	has_attached_file :image, :styles => { :medium => "300x300", :thumb => "100x100>" }, :default_url => "missing.png"
	validates :name, :description, :price, presence: true
	validates :price, numericality: { greater_than: 0 }
	belongs_to :user
	has_many :orders
	has_many :carts
	belongs_to :category
	has_many :reviews
end
