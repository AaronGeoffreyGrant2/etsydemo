class Spaceshootergame < ApplicationRecord
  validates :ship, :enemy, presence: true	
  belongs_to :user
end
