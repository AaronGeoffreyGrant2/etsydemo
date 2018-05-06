class Spaceshooter < ApplicationRecord
  validates :Game, :xs, :os, presence: true
  belongs_to :user
end
