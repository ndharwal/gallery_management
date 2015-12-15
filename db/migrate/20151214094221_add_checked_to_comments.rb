class AddCheckedToComments < ActiveRecord::Migration
  def change
    add_column :comments, :active, :boolean
    add_column :comments, :inactive, :boolean
  end
end
