class Tictactoe < ApplicationRecord
  validates :name, :description, :price, presence: true
  belongs_to :user
end
