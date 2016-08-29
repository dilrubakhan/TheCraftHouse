class Product < ActiveRecord::Base
	searchkick
	attr_accessor :filename
	
	if Rails.env.development?
	    has_attached_file :image, :styles => { :medium => "300x300", :thumb => "100x100>" }, :default_url => "missing.png"

	else
		has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "missing.png",
				    :storage => :dropbox,
				    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
				    :path => ":style/:id_:filename"
		end

	validates :name, :description, :price, presence: true
	validates :price, numericality: { greater_than: 0 }
	belongs_to :user
	has_many :orders
	has_many :carts
	belongs_to :category
	has_many :reviews
end
