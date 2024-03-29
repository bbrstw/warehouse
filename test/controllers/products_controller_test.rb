require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { account_id: @product.account_id, brand_id: @product.brand_id, category_id: @product.category_id, code: @product.code, cost: @product.cost, cost: @product.cost, description: @product.description, image: @product.image, name: @product.name, restock: @product.restock, sku: @product.sku, supplier_id: @product.supplier_id, weight: @product.weight, weight: @product.weight, weight_unit: @product.weight_unit }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { account_id: @product.account_id, brand_id: @product.brand_id, category_id: @product.category_id, code: @product.code, cost: @product.cost, cost: @product.cost, description: @product.description, image: @product.image, name: @product.name, restock: @product.restock, sku: @product.sku, supplier_id: @product.supplier_id, weight: @product.weight, weight: @product.weight, weight_unit: @product.weight_unit }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
