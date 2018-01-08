class Listing < ActiveRecord::Base 
	after_create :to_facebook
	mount_base64_uploader :image, ImageUploader
	validates :name, :description, :price, presence: true
	validates :price, numericality: { greater_than: 0 }
	validates_presence_of :image

	belongs_to :user
	has_many :orders

	def to_facebook
		if self.post_on_facebook == true
			self.user.facebook.put_wall_post("#{self.content}")
		end
	end
end 