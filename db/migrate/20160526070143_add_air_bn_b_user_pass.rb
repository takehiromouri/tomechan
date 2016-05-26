class AddAirBnBUserPass < ActiveRecord::Migration
  def change
    add_column :users, :airbnb_email, :string
    add_column :users, :airbnb_password, :string
  end
end
