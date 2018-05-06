class Platform < ApplicationRecord
  validates :Game, :player, :coin, :lava, :enemy_1, :enemy_2, :enemy_3, presence: true
  belongs_to :user
end
