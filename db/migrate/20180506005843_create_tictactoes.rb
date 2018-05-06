class CreateTictactoes < ActiveRecord::Migration[5.0]
  def change
    create_table :tictactoes do |t|
      t.string :Game
      t.references :user, foreign_key: true
      t.string :xs
      t.string :os

      t.timestamps
    end
  end
end
