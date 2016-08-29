json.array!(@lintitems) do |lintitem|
  json.extract! lintitem, :id, :product_id, :order_id, :quantity, :cart_id
  json.url lintitem_url(lintitem, format: :json)
end
