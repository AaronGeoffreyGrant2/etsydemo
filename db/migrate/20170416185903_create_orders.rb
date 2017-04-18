class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :emailaddress
      t.string :cellphonenumber
      t.string :cellphonecarrier

      t.timestamps
    end
  end
end
