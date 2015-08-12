require_relative 'test_helper'
require './lib/sales_engine'
require 'date'

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
    assert_equal BigDecimal.new('4.0'), merchant.revenue
  end

  def test_it_results_zero_when_transactions_failed
    merchant = mr.find_by_id(9)
    assert_equal 0, merchant.revenue
  end

  def test_it_can_find_the_merchant_with_the_highest_revenue
    assert_equal [8], mr.most_revenue(1)
  end

  def test_it_can_find_the_merchant_with_the_most_items_sold
    assert_equal [11], mr.most_items(1)
  end

  def test_it_can_find_the_total_revenue_on_a_specific_date
    date = Date.parse("2012-03-06 14:54:09 UTC")
    assert_equal BigDecimal.new('6.0'), mr.revenue(date)
  end

  def test_it_can_find_the_total_merchant_revenue_on_a_specific_date
    merchant = mr.find_by_id(8)
    date = Date.parse("2012-03-13 14:54:09 UTC")
    assert_equal BigDecimal.new('4.80'), merchant.revenue(date)
  end

  def test_it_can_find_the_merchants_favorite_customer
    merchant = mr.find_by_id(11)
    assert_equal 'Timothy', merchant.favorite_customer.first_name
  end

  def test_it_can_find_all_revenue
    assert_equal BigDecimal.new('25.10'), mr.revenue
  end
end