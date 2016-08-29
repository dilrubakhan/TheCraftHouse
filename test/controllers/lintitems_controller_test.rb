require 'test_helper'

class LintitemsControllerTest < ActionController::TestCase
  setup do
    @lintitem = lintitems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lintitems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lintitem" do
    assert_difference('Lintitem.count') do
      post :create, lintitem: { cart_id: @lintitem.cart_id, order_id: @lintitem.order_id, product_id: @lintitem.product_id, quantity: @lintitem.quantity }
    end

    assert_redirected_to lintitem_path(assigns(:lintitem))
  end

  test "should show lintitem" do
    get :show, id: @lintitem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lintitem
    assert_response :success
  end

  test "should update lintitem" do
    patch :update, id: @lintitem, lintitem: { cart_id: @lintitem.cart_id, order_id: @lintitem.order_id, product_id: @lintitem.product_id, quantity: @lintitem.quantity }
    assert_redirected_to lintitem_path(assigns(:lintitem))
  end

  test "should destroy lintitem" do
    assert_difference('Lintitem.count', -1) do
      delete :destroy, id: @lintitem
    end

    assert_redirected_to lintitems_path
  end
end
