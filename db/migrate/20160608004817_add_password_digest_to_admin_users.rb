class AddPasswordDigestToAdminUsers < ActiveRecord::Migration
  def up
  	add_column 'admin_users', 'password_digest', :string
  	remove_column 'admin_users', 'hashed_password'
  end

  def down
  	add_column 'admin_users', 'hashed_password', :limit => 40
  	remove_column 'admin_users', 'password_digest'

  end
end
