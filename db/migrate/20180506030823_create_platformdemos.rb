class CreatePlatformdemos < ActiveRecord::Migration[5.0]
  def change
    create_table :platformdemos do |t|
      t.string :Demo
      t.references :user, foreign_key: true
      t.string :player
      t.string :coin
      t.string :lava
      t.string :enmey

      t.timestamps
    end
  end
end
