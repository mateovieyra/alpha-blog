require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "Sports")
  end
  
  test "category should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    @other_category = Category.new(name: "Sports")
    assert_not @other_category.valid?
  end

  test "name should not be to short" do
    @category.name = "A" * 26
    assert_not @category.valid?
  end

  test "name should not be too long" do
    @category.name = "aa"
    assert_not @category.valid?
  end

end