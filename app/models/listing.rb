class Listing < ActiveRecord::Base
	after_create :to_facebook  
	mount_base64_uploader :image, ImageUploader
	validates :name, :description, :price, presence: true
	validates :price, numericality: { greater_than: 2 }
	validates_presence_of :image

	belongs_to :user
	has_many :orders

	def to_facebook
		if self.post_to_facebook == true
			self.user.facebook.put_wall_post("#{self.name}")
		end
	end
	def self.search(params)
		listings = all # for not existing params args
		listings = listings.where("name like ?", "%#{params[:name]}%") if params[:name]
		listings
	end
end 