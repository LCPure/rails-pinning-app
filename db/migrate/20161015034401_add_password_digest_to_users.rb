class AddPasswordDigestToUsers < ActiveRecord::Migration
  add_column :users, :password_digest, :string
  remove_column :users, :password
  
  def change
  end
end
