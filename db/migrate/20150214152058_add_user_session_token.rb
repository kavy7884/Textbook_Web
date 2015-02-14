class AddUserSessionToken < ActiveRecord::Migration
  def change
  	add_column :Users, :session_token, :string
  	add_index :Users, :session_token, unique: true
  end
end
