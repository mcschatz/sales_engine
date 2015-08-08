require_relative 'test_helper'
require './lib/sales_engine'

class InvoiceRelationshipTest < Minitest::Test
attr_reader :ir

  def setup
    sample = SalesEngine.new('test/fixtures')
    sample.startup
    @ir = sample.invoice_repository
  end

  def test_it_can_find_transaction_by_invoice_id
    invoice = ir.find_by_id(1)
    invoice1 = invoice.transactions
    assert_equal 2, invoice1.count
  end

  def test_it_can_find_invoice_items_by_invoice_id
    invoice = ir.find_by_id(1)
    invoice1 = invoice.invoice_items
    assert_equal 8, invoice1.count
  end

  def test_it_can_find_items_by_invoice_id
    invoice = ir.find_by_id(1)
    invoice1 = invoice.items
    assert_equal 8, invoice1.count
  end
end