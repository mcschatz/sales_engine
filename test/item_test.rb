require_relative 'test_helper'
require './lib/item'

class ItemTest < Minitest::Test
attr_reader :item

  def setup
    @item = Item.new({id: 1, name: 'Item1', description: 'Blue',
      unit_price: 75107, merchant_id: 1, created_at: '2012-03-27',
      updated_at: '2012-03-27 14:53:59 UTC', number_sold: 3}, self)
  end

  def test_the_item_has_an_id_attribute
    assert item.id
  end

  def test_the_item_has_a_name_attribute
    assert item.name
  end

  def test_the_item_has_a_description_attribute
    assert item.description
  end

  def test_the_item_has_an_unit_price_attribute
    assert item.unit_price
  end

  def test_the_item_has_a_merchant_id_attribute
    assert item.merchant_id
  end
end