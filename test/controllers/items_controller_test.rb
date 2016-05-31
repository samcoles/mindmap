require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  test "should display nested list items" do
    get :index
    assert assigns(:items), Item.roots
    assert_select 'ul#items' do
      assert_select "li#item_#{items(:best_practices).id}" do
        assert_select "li#item_#{items(:iterative_development).id}"
      end
    end
  end

  test "should display form" do
    get :new
    assert_template partial: "_form"
  end

  test "should create an item" do
    assert_difference 'Item.count' do
      post :create, item: {title: "Testing Strategies", parent_id: items(:best_practices).id}
    end
    assert_redirected_to items_path
  end
end
