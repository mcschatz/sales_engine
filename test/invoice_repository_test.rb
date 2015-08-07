require_relative 'test_helper'
require './lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test
  attr_reader :iir

  def setup
    invoice1 = Invoice.new({id: 1, customer_id: 1, merchant_id: 26, status: 'shipped', created_at: '2012-03-25 09:54:09 UTC', updated_at: '2012-03-25 09:54:09 UTC'}, self)
    invoice2 = Invoice.new({id: 2, customer_id: 1, merchant_id: 26, status: 'shipped', created_at: '2012-03-25 09:54:09 UTC', updated_at: '2012-03-25 09:54:09 UTC'}, self)
    invoice3 = Invoice.new({id: '', customer_id: '', merchant_id: '', status: '', created_at: '', updated_at: ''}, self)
    @iir = InvoiceRepository.new([invoice1, invoice2, invoice3], self)
  end

  def test_it_instantiates_an_empty_array
    sample = InvoiceRepository.new([], self)
    assert_equal 0, sample.invoices.count
  end

  def test_it_hold_one_invoice
    sample = InvoiceRepository.new(["hello jeff"], self)
    assert_equal 1, sample.invoices.count
  end

  def test_it_can_hold_three_invoices
    assert_equal 3, iir.invoices.count
  end

  def test_it_can_put_all_invoices
    assert_equal 3, iir.all.count
  end

  def test_it_can_find_a_random_invoice
    assert iir.random
  end

  def test_it_is_a_member_of_the_invoice_class
    assert_equal Invoice, iir.find_by_id(1).class
    assert_equal Invoice, iir.find_by_customer_id(1).class
    assert_equal Invoice, iir.find_by_merchant_id(26).class
    assert_equal Invoice, iir.find_by_status('shipped').class
  end

  def test_it_can_find_an_invoice_by_id
    assert_equal 1, iir.find_by_id(1).id
  end

  def test_it_can_find_an_invoice_by_customer_id
    assert_equal 1, iir.find_by_customer_id(1).customer_id
  end

  def test_it_can_find_an_invoice_by_merchant_id
    assert_equal 26, iir.find_by_merchant_id(26).merchant_id
  end

  def test_it_can_find_an_invoice_by_status
    assert_equal 'shipped', iir.find_by_status('shipped').status
  end

  def test_it_can_find_all_invoices_by_id
    assert_equal 1, iir.find_all_by_id(2).count
  end

  def test_it_can_find_all_invoices_by_customer_id
    assert_equal 2, iir.find_all_by_customer_id(1).count
  end

  def test_it_can_find_all_invoices_by_merchant_id
    assert_equal 2, iir.find_all_by_merchant_id(26).count
  end

  def test_it_can_find_all_invoices_by_status
    assert_equal 2, iir.find_all_by_status('shipped').count
  end

  def test_it_can_return_an_empty_array_when_there_is_no_value
    assert_equal [], iir.find_all_by_id('')
    assert_equal [], iir.find_all_by_customer_id('')
    assert_equal [], iir.find_all_by_merchant_id('')
    assert_equal [], iir.find_all_by_status('')
  end
end