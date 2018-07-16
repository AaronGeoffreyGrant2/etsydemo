class Tictactoegame < ApplicationRecord
  validates :xs, :os, presence: true
  belongs_to :user
end
