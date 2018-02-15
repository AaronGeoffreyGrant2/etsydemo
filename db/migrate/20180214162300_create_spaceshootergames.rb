class CreateSpaceshootergames < ActiveRecord::Migration[5.0]
  def change
    create_table :spaceshootergames do |t|
      t.references :user, foreign_key: true
      t.string :ship
      t.string :enemy

      t.timestamps
    end
  end
end
