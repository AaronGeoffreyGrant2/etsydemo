class CreatePlatforms < ActiveRecord::Migration[5.0]
  def change
    create_table :platforms do |t|
      t.string :Game
      t.references :user, foreign_key: true
      t.string :player
      t.string :coin
      t.string :lava
      t.string :enemy_1
      t.string :enemy_2
      t.string :enemy_3

      t.timestamps
    end
  end
end
