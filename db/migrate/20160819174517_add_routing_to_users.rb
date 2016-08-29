class AddRoutingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :routing, :string
  end
end
