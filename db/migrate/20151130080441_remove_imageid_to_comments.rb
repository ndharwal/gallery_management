class RemoveImageidToComments < ActiveRecord::Migration
  def change
    remove_column :comments, :image_id, :integer
  end
end
