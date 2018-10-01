class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
    	t.string :name
    	t.integer :image_count, :default => 0

    	t.timestamps
    end
  end
end
