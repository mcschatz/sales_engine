require_relative 'test_helper'
require './lib/invoice'

class InvoiceTest < Minitest::Test
  attr_reader :invoice

  def setup
    @invoice = Invoice.new({id: 1, customer_id: 1, merchant_id: 26,
      status: 'shipped', created_at: '2012-03-25 09:54:09 UTC',
      updated_at: '2012-03-25 09:54:09 UTC'}, self)
  end

  def test_the_invoice_has_an_id_attribute
    assert invoice.id
  end

  def test_the_invoice_has_a_customer_id_attribute
    assert invoice.customer_id
  end

  def test_the_invoice_has_a_merchant_id_attribute
    assert invoice.merchant_id
  end

  def test_the_invoice_has_a_status_attribute
    assert invoice.status
  end

  def test_the_invoice_has_a_created_at_attribute
    assert invoice.created_at
  end

  def test_the_invoice_has_an_updated_at_attribute
    assert invoice.updated_at
  end
end