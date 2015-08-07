require_relative 'test_helper'
require './lib/sales_engine'

class MerchantRelationshipTest < Minitest::Test
attr_reader :mr

  def setup
    sample = SalesEngine.new('test/fixtures')
    sample.startup
    @mr = sample.merchant_repository
  end

  def test_it_can_find_a_merchants_items
    merchant = mr.find_by_id(1)
    items    = merchant.items
    assert_equal 2, items.count
  end

  def test_it_can_find_a_merchants_invoices
    merchant = mr.find_by_id(1)
    invoices    = merchant.invoices
    assert_equal 2, invoices.count
  end

  # def test_it_can_find_a_merchants_items_description
  #   merchant = mr.find_by_id(6)
  #   items    = merchant.items
  #   assert_equal #array, items[0]
  # end
end