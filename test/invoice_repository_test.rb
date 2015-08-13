require_relative 'test_helper'
require './lib/invoice_repository'
require './lib/sales_engine'

class InvoiceRepositoryTest < Minitest::Test
  attr_reader :ir

  def setup
    sample = SalesEngine.new('./test/fixtures')
    sample.startup
    @ir = sample.invoice_repository
  end

  def test_it_instantiates_all_invoices
    assert_equal 15, ir.invoices.count
  end

  def test_it_can_put_all_invoices
    assert_equal 15, ir.all.count
  end

  def test_it_can_find_a_random_invoice
    assert ir.random
  end

  def test_it_is_a_member_of_the_invoice_class
    assert_equal Invoice, ir.find_by_id(1).class
    assert_equal Invoice, ir.find_by_customer_id(1).class
    assert_equal Invoice, ir.find_by_merchant_id(3).class
    assert_equal Invoice, ir.find_by_status('shipped').class
  end

  def test_it_can_find_an_invoice_by_id
    assert_equal 1, ir.find_by_id(1).id
  end

  def test_it_can_find_an_invoice_by_customer_id
    assert_equal 1, ir.find_by_customer_id(1).customer_id
  end

  def test_it_can_find_an_invoice_by_merchant_id
    assert_equal 9, ir.find_by_merchant_id(9).merchant_id
  end

  def test_it_can_find_an_invoice_by_status
    assert_equal 'shipped', ir.find_by_status('shipped').status
  end

  def test_it_can_find_all_invoices_by_id
    assert_equal 1, ir.find_all_by_id(2).count
  end

  def test_it_can_find_all_invoices_by_customer_id
    assert_equal 2, ir.find_all_by_customer_id(1).count
  end

  def test_it_can_find_all_invoices_by_merchant_id
    assert_equal 1, ir.find_all_by_merchant_id(2).count
  end

  def test_it_can_find_all_invoices_by_status
    assert_equal 15, ir.find_all_by_status('shipped').count
  end

  def test_it_can_return_an_empty_array_when_there_is_no_value
    assert_equal [], ir.find_all_by_id('')
    assert_equal [], ir.find_all_by_customer_id('')
    assert_equal [], ir.find_all_by_merchant_id('')
    assert_equal [], ir.find_all_by_status('')
  end
end