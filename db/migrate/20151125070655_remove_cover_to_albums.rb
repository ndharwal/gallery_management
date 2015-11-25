class RemoveCoverToAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :cover, :string
  end
end
