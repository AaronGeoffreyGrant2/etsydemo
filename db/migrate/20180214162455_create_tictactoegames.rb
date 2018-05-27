class CreateTictactoegames < ActiveRecord::Migration[5.0]
  def change
    create_table :tictactoegames do |t|
      t.references :user, foreign_key: true
      t.string :xs
      t.string :os

      t.timestamps
    end
  end
end
