class ChangeContactTypeInUsers < ActiveRecord::Migration
  def change
    change_column :users, :contact, :string
  end
end
