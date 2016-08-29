class AddQuantityToOrderlines < ActiveRecord::Migration
  def change
    add_column :orderlines, :quantity, :integer
  end
end
