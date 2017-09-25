class RenameTheColumnsInTheOrdersController < ActiveRecord::Migration[5.0]
  def change
  	rename_column :orders, :cellphonenumber, :comments
  	rename_column :orders, :cellphonecarrier, :requests
  end
end
