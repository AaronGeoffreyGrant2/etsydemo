class Platformdemo < ApplicationRecord
  validates :Demo, :player, :coin, :lava, :enmey, presence: true
  belongs_to :user
end
