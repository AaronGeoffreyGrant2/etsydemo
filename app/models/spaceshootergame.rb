class Spaceshootergame < ApplicationRecord
  validates_presence_of :ship, :enemy, :message => "is empty. A graphic that you bought from the marketplace can be used here."
  belongs_to :user
end
