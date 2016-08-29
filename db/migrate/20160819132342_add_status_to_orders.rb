class AddStatusToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :status, :char
  end
end
