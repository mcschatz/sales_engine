require_relative 'test_helper'
require './lib/item_repository'

class ItemRepositoryTest < Minitest::Test

  def setup
    item1 = Item.new({id: 1, name: 'Item1', description: 'Qui Esse Nihil autem sit odio inventore deleniti.', unit_price: 75107, merchant_id: 1, created_at: '2012-03-27 14:53:59 UTC', updated_at: '2012-03-27 14:53:59 UTC'}, self)
    item2 = Item.new({id: 2, name: 'Item2', description: 'Qui Esse Nihil autem sit odio inventore deleniti.', unit_price: 75107, merchant_id: 1, created_at: '2012-03-27 14:53:59 UTC', updated_at: '2012-03-27 14:53:59 UTC'}, self)
    item3 = Item.new({id: '', name: '', description: '', unit_price: '', merchant_id: '', created_at: '', updated_at: ''}, self)
    item4 = Item.new({id: 4, name: 'Item', description: 'Qui Esse Nihil autem sit odio inventore deleniti.', unit_price: 75107, merchant_id: 1, created_at: '2012-03-27 14:53:59 UTC', updated_at: '2012-03-27 14:53:59 UTC'}, self)
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
    assert_equal 4, @ir.items.count
  end

  def test_it_can_put_all_items
    assert_equal 4, @ir.all.count
  end

  def test_it_can_find_a_random_item
    assert @ir.random
  end

#   def test_it_is_a_member_of_the_item_class
#     assert_equal item, @ir.find_by_id(1).class
#     assert_equal item, @ir.find_by_invoice_id(2).class
#     assert_equal item, @ir.find_by_credit_card_number(4654405418249630).class
#     assert_equal item, @ir.find_by_credit_card_expiration_date('11/16').class
#     assert_equal item, @ir.find_by_result("success").class
#     assert_equal item, @ir.find_by_created_at('2012-03-27 14:54:09 UTC').class
#     assert_equal item, @ir.find_by_updated_at('2013-01-24 13:51:09 UTC').class
#   end

#   def test_it_can_find_a_item_by_id
#     assert_equal 1, @ir.find_by_id(1).id
#   end

#   def test_it_can_find_a_item_by_invoice_id
#     assert_equal 2, @ir.find_by_invoice_id(2).invoice_id
#   end

#   def test_it_can_find_a_item_by_credit_card_number
#     assert_equal 4654405418249630, @ir.find_by_credit_card_number(4654405418249630).credit_card_number
#   end

#   def test_it_can_find_a_item_by_credit_card_expiration_date
#     assert_equal '11/16', @ir.find_by_credit_card_expiration_date('11/16').credit_card_expiration_date
#   end

#   def test_it_can_find_a_item_by_result
#     assert_equal 'failed', @ir.find_by_result('failed').result
#   end

#   def test_it_can_find_a_item_by_created_at
#     assert_equal '2012-03-27 14:54:09 UTC', @ir.find_by_created_at('2012-03-27 14:54:09 UTC').created_at
#   end

#   def test_it_can_find_a_item_by_updated_at
#     assert_equal '2013-01-24 13:51:09 UTC', @ir.find_by_updated_at('2013-01-24 13:51:09 UTC').updated_at
#   end

#   def test_it_can_find_all_items_by_id
#     assert_equal 1, @ir.find_all_by_id(1).count
#   end

#   def test_it_can_find_all_items_by_invoice_id
#     assert_equal 2, @ir.find_all_by_invoice_id(2).count
#   end

#   def test_it_can_find_all_items_by_credit_card_number
#     assert_equal 2, @ir.find_all_by_credit_card_number(4654405418249621).count
#   end

#   def test_it_can_find_all_items_by_credit_card_expiration_date
#     assert_equal 2, @ir.find_all_by_credit_card_expiration_date('11/16').count
#   end

#   def test_it_can_find_all_items_by_result
#     assert_equal 2, @ir.find_all_by_result('success').count
#   end

#   def test_it_can_find_all_items_by_created_at
#     assert_equal 2, @ir.find_all_by_created_at('2011-09-24 13:59:05 UTC').count
#   end

#   def test_it_can_find_all_items_by_updated_at
#     assert_equal 2, @ir.find_all_by_updated_at('2013-01-24 13:51:09 UTC').count
#   end

#   def test_it_can_return_an_empty_array_when_there_is_no_value
#     assert_equal [], @ir.find_all_by_id('')
#     assert_equal [], @ir.find_all_by_invoice_id('')
#     assert_equal [], @ir.find_all_by_credit_card_number('')
#     assert_equal [], @ir.find_all_by_credit_card_expiration_date('')
#     assert_equal [], @ir.find_all_by_result('')
#     assert_equal [], @ir.find_all_by_created_at('')
#     assert_equal [], @ir.find_all_by_updated_at('')
#   end
# def test_the_item_has_an_id_attribute
#     assert @item.id
#   end

#   def test_the_item_has_a_name_attribute
#     assert @item.name
#   end

#   def test_the_item_has_a_description_attribute
#     assert @item.description
#   end

#   def test_the_item_has_an_unit_price_attribute
#     assert @item.unit_price
#   end

#   def test_the_item_has_a_merchant_id_attribute
#     assert @item.merchant_id
#   end

#   def test_the_item_has_a_created_at_attribute
#     assert @item.created_at
#   end

#   def test_the_item_has_an_updated_at_attribute
#     assert @item.updated_at
#   end
end