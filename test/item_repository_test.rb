require_relative 'test_helper'
require './lib/item_repository'

class ItemRepositoryTest < Minitest::Test
attr_reader :ir
  def setup
    item1 = Item.new({id: 1, name: 'Item1', description: 'Qui Esse Nihil autem sit odio inventore deleniti.', unit_price: 75107, merchant_id: 1}, self)
    item2 = Item.new({id: 2, name: 'Item', description: 'Qui Esse Nihil autem sit odio inventore deleniti.', unit_price: 75107, merchant_id: 1}, self)
    item3 = Item.new({id: '', name: '', description: '', unit_price: '', merchant_id: ''}, self)
    item4 = Item.new({id: 4, name: 'Item', description: 'Qui Esse Nihil autem sit odio inventore deleniti.', unit_price: 75107, merchant_id: 1}, self)
    @ir = ItemRepository.new([item1, item2, item3, item4])
  end

  def test_it_instantiates_an_empty_array
    sample = ItemRepository.new([])
    assert_equal 0, sample.items.count
  end

  def test_it_hold_one_item
    sample = ItemRepository.new(["hello jeff"])
    assert_equal 1, sample.items.count
  end

  def test_it_can_hold_four_items
    assert_equal 4, ir.items.count
  end

  def test_it_can_put_all_items
    assert_equal 4, ir.all.count
  end

  def test_it_can_find_a_random_item
    assert ir.random
  end

  def test_it_is_a_member_of_the_item_class
    assert_equal Item, ir.find_by_id(1).class
    assert_equal Item, ir.find_by_name('Item1').class
    assert_equal Item, ir.find_by_description('Qui Esse Nihil autem sit odio inventore deleniti.').class
    assert_equal Item, ir.find_by_merchant_id(1).class
    assert_equal Item, ir.find_by_unit_price(75107).class
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
    assert_equal 'Qui Esse Nihil autem sit odio inventore deleniti.', ir.find_by_description('Qui Esse Nihil autem sit odio inventore deleniti.').description
  end

  def test_it_can_find_a_item_by_merchant_id
    assert_equal 1, ir.find_by_merchant_id(1).merchant_id
  end

  def test_it_can_find_a_item_by_unit_price
    assert_equal 75107, ir.find_by_unit_price(75107).unit_price
  end

  def test_it_can_find_all_items_by_id
    assert_equal 1, ir.find_all_by_id(1).count
  end

  def test_it_can_find_all_items_by_name
    assert_equal 2, ir.find_all_by_name('Item').count
  end

  def test_it_can_find_all_items_by_description
    assert_equal 3, ir.find_all_by_description('Qui Esse Nihil autem sit odio inventore deleniti.').count
  end

  def test_it_can_find_all_items_by_merchant_id
    assert_equal 3, ir.find_all_by_merchant_id(1).count
  end

  def test_it_can_find_all_items_by_unit_price
    assert_equal 3, ir.find_all_by_unit_price(75107).count
  end

  def test_it_can_return_an_empty_array_when_there_is_no_value
    assert_equal [], ir.find_all_by_id('')
    assert_equal [], ir.find_all_by_name('')
    assert_equal [], ir.find_all_by_description('')
    assert_equal [], ir.find_all_by_merchant_id('')
    assert_equal [], ir.find_all_by_unit_price('')
  end
end