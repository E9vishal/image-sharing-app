class AddUserIdToAlbums < ActiveRecord::Migration[5.2]
  def change
  	add_column :albums, :user_id, :integer, :after => :image_count
  end
end
