class Cart < ActiveRecord::Base
	belongs_to :product
	
	has_many :lintitems, :dependent => :destroy
end
