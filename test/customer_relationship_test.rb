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
    invoices    = customer.invoices
    assert_equal 8, invoices.count
  end

  #What happens if we ask for something that is not there
end
