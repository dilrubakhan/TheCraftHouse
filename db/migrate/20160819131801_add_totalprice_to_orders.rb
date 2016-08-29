class AddTotalPriceToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :totalprice, :char
  end
end
