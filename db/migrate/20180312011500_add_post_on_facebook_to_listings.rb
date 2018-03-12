class AddPostOnFacebookToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :post_to_facebook, :boolean
  end
end
