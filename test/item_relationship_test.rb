require_relative 'test_helper'
require './lib/sales_engine'

class ItemRelationshipTest < Minitest::Test
attr_reader :ir

  def setup
    sample = SalesEngine.new('./test/fixtures')
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
    assert_equal 1, invoice_item.count
  end

  def test_it_can_find_most_revenue_by_items
    sample = ir.most_revenue(1)
    assert_equal 8, sample.first.id
  end

  def test_it_can_find_successful_transactions
    item     = ir.find_by_id(1)
    assert_equal 1, item.successful_transactions.count
  end

  def test_it_can_find_the_top_item_instances_ranked_by_total_number_sold
    sample = ir.most_items(1)
    assert_equal 2, sample.first.id
  end

  def test_it_can_find_the_date_of_the_best_day
    item     = ir.find_by_id(2)
    assert_equal Date.parse('2012-03-06'), item.best_day
  end

  def test_it_can_find_the_most_items_sold
    sample = ir.most_items
    assert_equal 'Item2', sample.first.name
  end

  def test_it_can_find_an_items_most_items_sold
    item     = ir.find_by_id(2)
    assert_equal 49, item.items_sold
  end
end