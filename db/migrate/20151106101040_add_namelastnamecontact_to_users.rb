class AddNamelastnamecontactToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :contact, :integer
  end
end
