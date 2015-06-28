class AlterUsers < ActiveRecord::Migration
  def up
  	rename_table("users", "admin_users")
  	add_column("admin_users", "username", :string, :limit => 25, :after => "email")
  	change_column("admin_users", "email", :string, :limit => 100)
  	rename_column("admin_users", "password", "hashed password")
		puts "***Adding and index is next***"
  	add_index("admin_users", "username")
  end

  def down
  	remove_index("admin_users", "username")
  	rename_column("admin_users", "hashed password", "password")
  	change_column("admin_users", "email", :string, :default => "",:null => false)
  	remove_column("admin_users", "username")
		rename_table("admin_users", "users")
  end
end
