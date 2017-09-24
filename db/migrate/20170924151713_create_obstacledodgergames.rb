class CreateObstacledodgergames < ActiveRecord::Migration[5.0]
  def change
    create_table :obstacledodgergames do |t|
      t.string :dodgerimage

      t.timestamps
    end
  end
end
