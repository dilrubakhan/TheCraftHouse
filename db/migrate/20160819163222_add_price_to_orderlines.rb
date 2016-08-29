class AddPriceToOrderlines < ActiveRecord::Migration
  def change
    add_column :orderlines, :price, :integer
  end
end
