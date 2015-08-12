require_relative 'test_helper'
require './lib/sales_engine'

class CustomerRelationshipTest < Minitest::Test
attr_reader :cr

  def setup
    sample = SalesEngine.new('test/fixtures')
    sample.startup
    @cr = sample.customer_repository
  end

  def test_it_can_find_a_customers_invoices
    customer = cr.find_by_id(1)
    invoices = customer.invoices
    assert_equal 2, invoices.count
  end

  def test_it_can_find_a_customers_transactions
    customer = cr.find_by_id(1)
    assert_equal 2, customer.transactions.count
  end

  def test_it_can_find_a_customers_favorite_merchant
    customer = cr.find_by_id(11)
    assert_equal 'Person K', customer.favorite_merchant.name
  end
end
