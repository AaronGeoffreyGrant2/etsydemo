class Listing < ActiveRecord::Base 
	mount_base64_uploader :image, ImageUploader
	validates :name, :description, :price, presence: true
	validates :price, numericality: { greater_than: 0 }
	validates_presence_of :image

	belongs_to :user
	has_many :orders
	def self.search(params)
		listings = all # for not existing params args
		listings = listings.where("name like ?", "%#{params[:name]}%") if params[:name]
		listings
	end
end 