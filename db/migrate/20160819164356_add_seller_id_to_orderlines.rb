class AddSellerIdToOrderlines < ActiveRecord::Migration
  def change
    add_column :orderlines, :seller_id, :integer
  end
end
