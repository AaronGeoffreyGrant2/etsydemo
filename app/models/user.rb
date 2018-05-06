class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable
  
  def mailboxer_email(object)
    nil
  end       

  validates :name, presence: true
  has_many :listings, dependent: :destroy
  has_many :platforms, dependent: :destroy
  has_many :platformdemos, dependent: :destroy
  has_many :spaceshooters, dependent: :destroy
  has_many :tictactoes, dependent: :destroy
  has_many :sales, class_name: "Order", foreign_key: "seller_id"
  has_many :purchases, class_name: "Order", foreign_key: "buyer_id"
end
