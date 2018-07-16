class Tictactoegame < ApplicationRecord
  validates_presence_of :xs, :os, :message => "is lacking. Use a graphic that you bought here."
  belongs_to :user
end
