class CreatePlatformgames < ActiveRecord::Migration[5.0]
  def change
    create_table :platformgames do |t|
      t.references :user, foreign_key: true
      t.string :player
      t.string :playerdies
      t.string :playerbeatslevel
      t.string :coin
      t.string :lava
      t.string :enemy
      t.string :levelplatform
      t.string :levelbackground

      t.timestamps
    end
  end
end
