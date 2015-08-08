require_relative 'test_helper'
require './lib/sales_engine'

class ItemRelationshipTest < Minitest::Test
attr_reader :ir

  def setup
    sample = SalesEngine.new('test/fixtures')
    sample.startup
    @ir = sample.item_repository
  end

  def test_it_can_find_a_single_items_merchant
    item     = ir.find_by_id(1)
    merchant = item.merchant.name
    assert_equal "Person A", merchant
  end

  def test_it_can_find_an_items_invoice_items
    item = ir.find_by_id(1)
    invoice_item = item.invoice_items
    assert_equal 2, invoice_item.count
  end
end