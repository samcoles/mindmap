require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "should require a title" do
    item = Item.new
    assert_not item.save, "Saved item without title"
  end

  test "should model a tree" do
    assert_includes items(:best_practices).children, items(:iterative_development)
    assert_equal items(:best_practices), items(:iterative_development).parent
  end

  test "should contain an ordered list of children in each item" do
    first_item = items(:best_practices).children.create(title: "Prepend", position: 0)
    assert_equal first_item, items(:best_practices).children.first, "Did not order by position"
  end

  test "should return root items" do
    assert [items(:best_practices)], Item.roots
  end
end
