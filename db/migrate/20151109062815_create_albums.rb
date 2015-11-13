class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
