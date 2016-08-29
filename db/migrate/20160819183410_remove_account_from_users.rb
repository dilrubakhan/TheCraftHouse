class RemoveAccountFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :account, :string
  end
end
