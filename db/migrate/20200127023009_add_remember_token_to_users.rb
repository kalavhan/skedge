class AddRememberTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :session_token, :string
    add_column :users, :login_token, :string
  end
end
