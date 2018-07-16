class Platformgame < ApplicationRecord
  validates :player, :playerdies, :playerbeatslevel, :coin, :lava, :enemy, :levelplatform, :levelbackground, presence: true
  belongs_to :user
end
