class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  validates :name, presence: true
  has_many :listings, dependent: :destroy
  has_many :sales, class_name: "Order", foreign_key: "seller_id"
  has_many :purchases, class_name: "Order", foreign_key: "buyer_id"

  	def facebook
	  @facebook ||= Koala::Facebook::API.new(Devise.friendly_token[0,20])
	end

	def facebook
	  @facebook ||= Koala::Facebook::API.new(Devise.friendly_token[0,20])
	  block_given? ? yield(@facebook) : @facebook
	rescue Koala::Facebook::APIError => e
	  logger.info e.to_s
	  nil # or consider a custom null object
	end

	def friends_count
	  facebook { |fb| fb.get_connection("me", "friends").size }
	end

	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.name = auth.info.name   # assuming the user model has a name
	    user.image = auth.info.image # assuming the user model has an image
	  end
	end
end