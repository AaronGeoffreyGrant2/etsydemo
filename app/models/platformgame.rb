class Platformgame < ApplicationRecord
  validates_presence_of :player, :playerdies, :playerbeatslevel, :coin, :lava, :enemy, :levelplatform, :levelbackground, :message => "is blank. Please fill it with a graphic that you sold in the marketplace."
  belongs_to :user
end
