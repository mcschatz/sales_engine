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
    assert_equal 1, items.count
  end

  def test_it_can_find_a_merchants_invoices
    merchant = mr.find_by_id(1)
    invoices    = merchant.invoices
    assert_equal 1, invoices.count
  end

  def test_it_can_return_a_merchants_total_revenue
    merchant = mr.find_by_id(10)
    assert_equal 400, merchant.revenue
  end

  def test_it_results_zero_when_transactions_failed
    merchant = mr.find_by_id(9)
    assert_equal 0, merchant.revenue
  end

  def test_it_can_find_the_merchant_with_the_highest_revenue
    assert_equal [8], mr.most_revenue(1)
  end

  def test_it_can_find_the_merchant_with_the_most_items_sold
    assert_equal [2], mr.most_items(1)
  end

  def test_it_can_find_the_total_revenue_on_a_specific_date
    assert_equal 2310, mr.revenue("2012-03-27 14:54:09 UTC")
  end
end













