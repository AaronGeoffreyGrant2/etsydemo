class CreateSpaceshooters < ActiveRecord::Migration[5.0]
  def change
    create_table :spaceshooters do |t|
      t.string :Game
      t.references :user, foreign_key: true
      t.string :playership
      t.string :enemyships

      t.timestamps
    end
  end
end
