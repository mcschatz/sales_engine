require_relative 'test_helper'
require './lib/sales_engine'
require 'bigdecimal'

class ItemRepositoryTest < Minitest::Test
attr_reader :ir

  def setup
    sample = SalesEngine.new('test/fixtures')
    sample.startup
    @ir = sample.item_repository
  end

  def test_all_items_are_present
    assert_equal 10, ir.items.count
  end

  def test_it_can_find_a_random_item
    assert ir.random
  end

  def test_it_is_a_member_of_the_item_class
    assert_equal Item, ir.find_by_id(1).class
    assert_equal Item, ir.find_by_name('Item1').class
    assert_equal Item, ir.find_by_description('Blue').class
    assert_equal Item, ir.find_by_merchant_id(1).class
  end

  def test_it_can_find_a_item_by_id
    assert_equal 1, ir.find_by_id(1).id
  end

  def test_it_can_find_a_item_by_name
    assert_equal 'Item1', ir.find_by_name('Item1').name
  end

  def test_it_can_find_a_transaction_name_is_case_insensitive
    assert_equal "Item1", ir.find_by_name('item1').name
  end

  def test_it_can_find_a_item_by_description
    assert ir.find_by_description('Blue')
  end

  def test_it_can_find_a_item_by_merchant_id
    assert_equal 1, ir.find_by_merchant_id(1).merchant_id
  end

  def test_it_can_find_a_item_by_unit_price
    assert ir.find_by_unit_price(0.10)
  end

  def test_it_can_find_all_items_by_id
    assert_equal 1, ir.find_all_by_id(1).count
  end

  def test_it_can_find_all_items_by_name
    assert_equal 1, ir.find_all_by_name('Item1').count
  end

  def test_it_can_find_all_items_by_description
    assert_equal 10, ir.find_all_by_description('Blue').count
  end

  def test_it_can_find_all_items_by_merchant_id
    assert_equal 1, ir.find_all_by_merchant_id(1).count
  end

  def test_it_can_find_all_items_by_unit_price
    assert_equal 0, ir.find_all_by_unit_price(30).count
  end

  def test_it_can_return_an_empty_array_when_there_is_no_value
    assert_equal [], ir.find_all_by_id('')
    assert_equal [], ir.find_all_by_name('')
    assert_equal [], ir.find_all_by_description('')
    assert_equal [], ir.find_all_by_merchant_id('')
    assert_equal [], ir.find_all_by_unit_price('')
  end
end